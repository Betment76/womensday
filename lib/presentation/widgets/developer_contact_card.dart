import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/presentation/widgets/section_card.dart';

/// Раскрывающаяся почта поддержки на экране «О приложении».
class DeveloperContactCard extends StatefulWidget {
  const DeveloperContactCard({super.key});

  @override
  State<DeveloperContactCard> createState() => _DeveloperContactCardState();
}

class _DeveloperContactCardState extends State<DeveloperContactCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Написать разработчику',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: SakuraColors.sakura,
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: AppConstants.animationDuration,
            curve: AppConstants.animationCurve,
            alignment: Alignment.topCenter,
            child: _isExpanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
                    child: InkWell(
                      onTap: executeCopyEmail,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppConstants.supportEmail,
                                style: const TextStyle(
                                  color: SakuraColors.sakura,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: SakuraColors.sakura,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.copy,
                              size: 18,
                              color: SakuraColors.sakura,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }

  Future<void> executeCopyEmail() async {
    await Clipboard.setData(
      const ClipboardData(text: AppConstants.supportEmail),
    );
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Адрес скопирован')));
  }
}
