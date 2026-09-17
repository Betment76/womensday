import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:womensday/core/constants/legal_documents.dart';
import 'package:womensday/core/constants/tbank_config.dart';
import 'package:womensday/core/theme/sakura_colors.dart';

/// Способ оплаты премиума.
enum PremiumPaymentMethod { sbp, rustore }

/// Результат шторки согласия: выбранный способ и email для чека.
class PremiumConsentResult {
  const PremiumConsentResult({
    required this.method,
    required this.email,
  });

  final PremiumPaymentMethod method;
  final String email;
}

/// Согласие с офертой перед покупкой премиума.
class PremiumConsentDialog extends StatefulWidget {
  const PremiumConsentDialog({super.key});

  static Future<PremiumConsentResult?> executeShow(BuildContext context) async {
    return showModalBottomSheet<PremiumConsentResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      barrierColor: const Color(0x59000000),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: const PremiumConsentDialog(),
        );
      },
    );
  }

  @override
  State<PremiumConsentDialog> createState() => _PremiumConsentDialogState();
}

class _PremiumConsentDialogState extends State<PremiumConsentDialog> {
  final TextEditingController _emailController = TextEditingController();
  bool _hasAccepted = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool executeIsValidEmail(String value) {
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim());
  }

  String executeReceiptEmail() {
    final String email = _emailController.text.trim();
    if (!executeIsValidEmail(email)) {
      return '';
    }
    return email;
  }

  void _executeReturn(PremiumPaymentMethod method) {
    Navigator.pop(
      context,
      PremiumConsentResult(method: method, email: executeReceiptEmail()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: SakuraColors.card,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: SakuraColors.petal,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              'Купить премиум',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            Text(
              '${TBankConfig.premiumAmountRubles.toStringAsFixed(0)} ₽',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 28,
                color: SakuraColors.sakura,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'После оплаты отключается вся реклама. Сохраните номер заказа.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              autofillHints: const <String>[AutofillHints.email],
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'name@mail.ru',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: _hasAccepted,
                    activeColor: SakuraColors.sakura,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (bool? value) {
                      setState(() => _hasAccepted = value ?? false);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(child: _buildConsentText(context)),
              ],
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _hasAccepted
                  ? () => _executeReturn(PremiumPaymentMethod.sbp)
                  : null,
              icon: const Icon(Icons.account_balance_wallet_outlined),
              label: const Text('Оплатить СБП'),
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              onPressed: _hasAccepted
                  ? () => _executeReturn(PremiumPaymentMethod.rustore)
                  : null,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF0A66C0),
                foregroundColor: Colors.white,
                disabledBackgroundColor: const Color(0xFF0A66C0).withValues(
                  alpha: 0.38,
                ),
                disabledForegroundColor: Colors.white.withValues(alpha: 0.38),
              ),
              icon: const Icon(Icons.store_outlined),
              label: const Text('Оплатить в RuStore'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsentText(BuildContext context) {
    final TextStyle? base = Theme.of(context).textTheme.bodySmall;
    final TextStyle link = (base ?? const TextStyle()).copyWith(
      color: SakuraColors.sakura,
      decoration: TextDecoration.underline,
      decorationColor: SakuraColors.sakura,
    );
    return Text.rich(
      TextSpan(
        style: base,
        children: <InlineSpan>[
          const TextSpan(text: 'Согласен с '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: () {
                context.push('/legal', extra: LegalDocuments.publicOffer);
              },
              child: Text('офертой', style: link),
            ),
          ),
          const TextSpan(text: ' и '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: () {
                context.push('/legal', extra: LegalDocuments.consentPd);
              },
              child: Text('согласием', style: link),
            ),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
