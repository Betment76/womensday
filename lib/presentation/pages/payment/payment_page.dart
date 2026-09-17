import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as cct;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:womensday/core/constants/tbank_config.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/data/services/appmetrica_service.dart';
import 'package:womensday/data/services/tbank_payment_service.dart';
import 'package:womensday/domain/entities/payment_session.dart';
import 'package:womensday/presentation/controllers/premium_controller.dart';

/// Оплата PayTbank: Custom Tabs, deeplink, опрос /status.php.
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.session});

  final PaymentSession session;

  static Future<void> executeShow({
    required BuildContext context,
    required PaymentSession session,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      barrierColor: const Color(0x59000000),
      builder: (BuildContext context) {
        return PaymentPage(session: session);
      },
    );
  }

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> with WidgetsBindingObserver {
  final TBankPaymentService _payments = getIt<TBankPaymentService>();
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSub;
  Timer? _statusTimer;
  bool _isCompleted = false;
  bool _isPaid = false;
  bool _isVerifying = false;
  String _statusText = 'Открываем форму Т‑Банка…';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _listenToDeeplinks();
    unawaited(_openPaymentUrl());
    _statusTimer = Timer.periodic(
      TBankConfig.statusPollInterval,
      (_) => unawaited(_verifyPayment()),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _statusTimer?.cancel();
    _linkSub?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(_closeBankBrowser());
      unawaited(_verifyPayment());
    }
  }

  Uri get _paymentUri {
    final Uri uri = Uri.parse(widget.session.paymentUrl);
    if (uri.host == 'qr.nspk.ru' || uri.host.endsWith('.nspk.ru')) {
      return uri;
    }
    return uri.replace(
      queryParameters: <String, String>{...uri.queryParameters, 'mobile': '1'},
    );
  }

  void _listenToDeeplinks() {
    _linkSub = _appLinks.uriLinkStream.listen(_handleDeeplink);
  }

  void _handleDeeplink(Uri uri) {
    final bool isPaymentReturn =
        uri.host == 'payment' && uri.scheme == TBankConfig.paymentReturnScheme;
    if (!isPaymentReturn) {
      return;
    }
    unawaited(_closeBankBrowser());
    final String result = uri.pathSegments.isEmpty
        ? ''
        : uri.pathSegments.first;
    if (result == 'fail') {
      unawaited(_finish(paid: false));
      return;
    }
    unawaited(_verifyPayment());
  }

  Future<void> _closeBankBrowser() async {
    try {
      await cct.closeCustomTabs();
    } catch (_) {}
    try {
      await closeInAppWebView();
    } catch (_) {}
  }

  Future<void> _openPaymentUrl() async {
    try {
      await cct.launchUrl(
        _paymentUri,
        customTabsOptions: const cct.CustomTabsOptions(
          urlBarHidingEnabled: true,
          showTitle: true,
        ),
        safariVCOptions: const cct.SafariViewControllerOptions(
          barCollapsingEnabled: true,
          dismissButtonStyle: cct.SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (_) {
      final bool launched = await launchUrl(
        _paymentUri,
        mode: LaunchMode.externalApplication,
      );
      if (!mounted) {
        return;
      }
      if (!launched) {
        setState(() => _statusText = 'Не удалось открыть форму оплаты.');
        return;
      }
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _statusText =
          'После оплаты вернитесь в приложение. Статус обновится сам.';
    });
  }

  Future<void> _verifyPayment() async {
    if (_isCompleted || _isVerifying) {
      return;
    }
    _isVerifying = true;
    try {
      final PaymentStatus status = await _payments.executeFetchStatus(
        paymentId: widget.session.paymentId,
        orderId: widget.session.orderId,
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _statusText = status.bankStatus == null
            ? 'Ожидание оплаты…'
            : 'Статус: ${status.bankStatus}';
      });
      if (status.isPaid) {
        await _finish(paid: true);
        return;
      }
      if (status.isFinalFailed) {
        await _finish(paid: false);
      }
    } catch (_) {
    } finally {
      _isVerifying = false;
    }
  }

  Future<void> _finish({required bool paid}) async {
    if (_isCompleted) {
      return;
    }
    _isCompleted = true;
    _statusTimer?.cancel();
    unawaited(_closeBankBrowser());
    unawaited(
      getIt<AppMetricaService>().executeReportEvent(
        paid ? 'premium_success' : 'premium_failed',
        attributes: <String, Object>{
          'amount': widget.session.amountRubles.round(),
          'order_id': widget.session.orderId,
        },
      ),
    );
    if (paid && mounted) {
      await ProviderScope.containerOf(context)
          .read(premiumControllerProvider.notifier)
          .executeActivate(
            paymentId: widget.session.paymentId,
            orderId: widget.session.orderId,
          );
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _isPaid = paid;
      _statusText = paid ? 'Оплата прошла успешно' : 'Платёж не завершён';
    });
  }

  Future<void> _onClose() async {
    await _verifyPayment();
    if (!mounted) {
      return;
    }
    Navigator.of(context).pop();
  }

  Future<void> _copyOrderId() async {
    await Clipboard.setData(ClipboardData(text: widget.session.orderId));
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Номер заказа скопирован')));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) {
          return;
        }
        unawaited(_onClose());
      },
      child: Material(
        color: SakuraColors.card,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: SakuraColors.petal,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Оплата ${widget.session.amountRubles.toStringAsFixed(0)} ₽',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => unawaited(_onClose()),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (_isPaid)
                _buildSuccess()
              else if (_isCompleted)
                _buildFailed()
              else
                _buildPending(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPending() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          const CircularProgressIndicator(color: SakuraColors.sakura),
          const SizedBox(height: 20),
          Text(_statusText, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildFailed() {
    return Column(
      children: [
        const Icon(
          Icons.error_outline,
          color: SakuraColors.deepBlossom,
          size: 56,
        ),
        const SizedBox(height: 16),
        const Text(
          'Оплата не прошла',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        const SizedBox(height: 12),
        const Text(
          'Попробуйте ещё раз или воспользуйтесь другим способом оплаты в вашем банке.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () => unawaited(_onClose()),
            child: const Text('Понятно'),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Премиум активирован',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        const SizedBox(height: 16),
        const Text(
          'Сохраните номер заказа — он нужен, чтобы восстановить покупку.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        _buildOrderIdBlock(),
      ],
    );
  }

  Widget _buildOrderIdBlock() {
    return Column(
      children: [
        SelectableText(
          widget.session.orderId,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => unawaited(_copyOrderId()),
            icon: const Icon(Icons.copy),
            label: const Text('Скопировать'),
          ),
        ),
      ],
    );
  }
}
