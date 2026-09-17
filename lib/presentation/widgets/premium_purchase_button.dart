import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:womensday/core/constants/tbank_config.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/data/services/appmetrica_service.dart';
import 'package:womensday/data/services/premium_entitlement_service.dart';
import 'package:womensday/data/services/rustore_pay_service.dart';
import 'package:womensday/data/services/tbank_payment_service.dart';
import 'package:womensday/domain/entities/payment_session.dart';
import 'package:womensday/presentation/controllers/premium_controller.dart';
import 'package:womensday/presentation/pages/payment/payment_page.dart';
import 'package:womensday/presentation/widgets/premium_consent_dialog.dart';
import 'package:womensday/presentation/widgets/restore_purchase_button.dart';

/// Покупка премиума через PayTbank (СБП) или RuStore Pay.
class PremiumPurchaseButton extends ConsumerStatefulWidget {
  const PremiumPurchaseButton({super.key});

  @override
  ConsumerState<PremiumPurchaseButton> createState() =>
      _PremiumPurchaseButtonState();
}

class _PremiumPurchaseButtonState extends ConsumerState<PremiumPurchaseButton> {
  bool _isOpening = false;

  Future<void> _executeStartPurchase() async {
    if (_isOpening) {
      return;
    }
    final PremiumConsentResult? consent = await PremiumConsentDialog
        .executeShow(context);
    if (consent == null || !mounted) {
      return;
    }
    switch (consent.method) {
      case PremiumPaymentMethod.sbp:
        await _executeOpenSbp(email: consent.email);
      case PremiumPaymentMethod.rustore:
        await _executeOpenRustore();
    }
  }

  Future<void> _executeOpenSbp({required String email}) async {
    setState(() => _isOpening = true);
    unawaited(
      getIt<AppMetricaService>().executeReportEvent(
        'premium_started',
        attributes: <String, Object>{
          'amount': TBankConfig.premiumAmountRubles.round(),
          'method': 'sbp',
        },
      ),
    );
    try {
      final TBankPaymentService payments = getIt<TBankPaymentService>();
      final PaymentSession session = await payments.executeInitPayment(
        orderId: payments.generateOrderId(),
        amountRubles: TBankConfig.premiumAmountRubles,
        description: TBankConfig.premiumDescription,
        email: email.isEmpty ? null : email,
      );
      if (!mounted) {
        return;
      }
      await getIt<PremiumEntitlementService>().executeRememberPayment(
        paymentId: session.paymentId,
        orderId: session.orderId,
      );
      if (!mounted) {
        return;
      }
      await PaymentPage.executeShow(context: context, session: session);
    } catch (_) {
      unawaited(
        getIt<AppMetricaService>().executeReportEvent(
          'premium_failed',
          attributes: <String, Object>{
            'amount': TBankConfig.premiumAmountRubles.round(),
            'stage': 'init',
            'method': 'sbp',
          },
        ),
      );
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось открыть оплату')),
      );
    } finally {
      if (mounted) {
        setState(() => _isOpening = false);
      }
    }
  }

  Future<void> _executeOpenRustore() async {
    setState(() => _isOpening = true);
    unawaited(
      getIt<AppMetricaService>().executeReportEvent(
        'premium_started',
        attributes: <String, Object>{
          'amount': TBankConfig.premiumAmountRubles.round(),
          'method': 'rustore',
        },
      ),
    );
    try {
      final RustorePayService rustore = getIt<RustorePayService>();
      final bool available = await rustore.executeIsAvailable();
      if (!available) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Платежи RuStore недоступны. Установите RuStore.'),
          ),
        );
        return;
      }
      final bool success = await rustore.executePurchase();
      if (!mounted) {
        return;
      }
      if (success) {
        ref.read(premiumControllerProvider.notifier).executeReconcile();
        unawaited(
          getIt<AppMetricaService>().executeReportEvent(
            'premium_completed',
            attributes: <String, Object>{
              'amount': TBankConfig.premiumAmountRubles.round(),
              'method': 'rustore',
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Премиум активирован. Реклама отключена.')),
        );
      } else {
        unawaited(
          getIt<AppMetricaService>().executeReportEvent(
            'premium_failed',
            attributes: <String, Object>{
              'amount': TBankConfig.premiumAmountRubles.round(),
              'stage': 'purchase',
              'method': 'rustore',
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Покупка не удалась. Попробуйте позже.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isOpening = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isPremium = ref.watch(premiumControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isPremium)
          const SectionPremiumActive()
        else
          FilledButton.icon(
            onPressed: _isOpening
                ? null
                : () => unawaited(_executeStartPurchase()),
            icon: _isOpening
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.workspace_premium_outlined),
            label: const Text('Купить премиум'),
          ),
        const SizedBox(height: 8),
        const RestorePurchaseButton(),
      ],
    );
  }
}

/// Плашка, если премиум уже куплен.
class SectionPremiumActive extends StatelessWidget {
  const SectionPremiumActive({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Премиум активен. Реклама отключена.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: SakuraColors.deepBlossom,
      ),
    );
  }
}
