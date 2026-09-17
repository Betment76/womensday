import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/data/services/rustore_pay_service.dart';
import 'package:womensday/presentation/controllers/premium_controller.dart';

/// Восстановление премиума по номеру заказа (СБП) или через RuStore.
class RestorePurchaseButton extends ConsumerStatefulWidget {
  const RestorePurchaseButton({super.key});

  @override
  ConsumerState<RestorePurchaseButton> createState() =>
      _RestorePurchaseButtonState();
}

class _RestorePurchaseButtonState extends ConsumerState<RestorePurchaseButton> {
  bool _isRestoring = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isRestoring ? null : () => unawaited(executeShowSheet()),
      child: _isRestoring
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Text('Восстановить покупку'),
    );
  }

  Future<void> executeShowSheet() async {
    final TextEditingController controller = TextEditingController();
    final String? orderId = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      barrierColor: const Color(0x59000000),
      builder: (BuildContext sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
          ),
          child: Material(
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
                    'Восстановить покупку',
                    textAlign: TextAlign.center,
                    style: Theme.of(sheetContext).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Введите номер заказа из чека или с экрана после оплаты.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Номер заказа',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Если номер утерян — напишите на ${AppConstants.supportEmail}',
                    textAlign: TextAlign.center,
                    style: Theme.of(sheetContext).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      Navigator.pop(sheetContext, controller.text.trim());
                    },
                    child: const Text('Восстановить'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(sheetContext, '__rustore__'),
                    child: const Text('Восстановить через RuStore'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => Navigator.pop(sheetContext),
                    child: const Text('Отмена'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.dispose();
    });
    if (!mounted) {
      return;
    }
    if (orderId == null) {
      return;
    }
    if (orderId == '__rustore__') {
      await _executeRestoreRustore();
      return;
    }
    if (orderId.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Введите номер заказа')));
      return;
    }
    setState(() => _isRestoring = true);
    try {
      final bool restored = await ref
          .read(premiumControllerProvider.notifier)
          .executeRestore(orderId);
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            restored
                ? 'Покупка восстановлена. Премиум активирован.'
                : 'Платёж не найден или не был успешным. Проверьте номер заказа.',
          ),
        ),
      );
    } catch (_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось проверить платёж')),
      );
    } finally {
      if (mounted) {
        setState(() => _isRestoring = false);
      }
    }
  }

  Future<void> _executeRestoreRustore() async {
    setState(() => _isRestoring = true);
    try {
      final RustorePayService rustore = getIt<RustorePayService>();
      await rustore.executeRestore();
      await ref.read(premiumControllerProvider.notifier).executeReconcile();
      if (!mounted) {
        return;
      }
      final bool isPremium = ref.read(premiumControllerProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isPremium
                ? 'Покупка RuStore восстановлена. Премиум активирован.'
                : 'Активная покупка RuStore не найдена.',
          ),
        ),
      );
    } catch (_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось восстановить покупку RuStore')),
      );
    } finally {
      if (mounted) {
        setState(() => _isRestoring = false);
      }
    }
  }
}
