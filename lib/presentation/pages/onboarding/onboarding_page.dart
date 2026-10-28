import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/l10n/app_localizations.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/controllers/locale_controller.dart';
import 'package:womensday/presentation/widgets/number_stepper.dart';
import 'package:womensday/presentation/widgets/sakura_background.dart';
import 'package:womensday/presentation/widgets/section_card.dart';

/// Короткий первый запуск: дата, длина цикла, длительность месячных.
class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _pageController = PageController();
  int _step = 0;
  DateTime _lastPeriodStart = DateTime.now();
  int _cycleLength = AppConstants.defaultCycleLength;
  int _periodDuration = AppConstants.defaultPeriodDuration;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return SakuraBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: Column(
              children: [
                const SakuraMark(size: 36),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    l10n.appName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    l10n.appSubtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: SakuraColors.wood),
                  ),
                ),
                const SizedBox(height: 16),
                executeDots(),
                const SizedBox(height: 16),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (int index) => setState(() => _step = index),
                    children: [
                      executeWelcomeStep(context),
                      executeDateStep(context),
                      executeCycleStep(context),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: executeContinue,
                  child: Text(
                    _step == 2 ? l10n.onboardingStart : l10n.onboardingNext,
                  ),
                ),
                if (_step > 0) ...[
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: executeBack,
                    child: Text(l10n.onboardingBack),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget executeDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, (int index) {
        final bool isActive = index == _step;
        return AnimatedContainer(
          duration: AppConstants.animationDuration,
          curve: AppConstants.animationCurve,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 18 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? SakuraColors.sakura : SakuraColors.blossom,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }

  Widget executeWelcomeStep(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return SectionCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.onboardingWelcomeTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: SakuraColors.branch,
            ),
          ),
          const SizedBox(height: 12),
          Text(l10n.onboardingWelcomeBody, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget executeDateStep(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String localeTag = ref.watch(localeControllerProvider).languageCode;
    final String label = DateFormat(
      'd MMMM yyyy',
      localeTag,
    ).format(_lastPeriodStart);
    return SectionCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.onboardingDateTitle,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: SakuraColors.deepBlossom,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: executePickDate,
            child: Text(l10n.pickDate),
          ),
        ],
      ),
    );
  }

  Widget executeCycleStep(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return SectionCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberStepper(
            label: l10n.cycleLengthLabel,
            value: _cycleLength,
            unit: l10n.daysUnit,
            min: AppConstants.minCycleLength,
            max: AppConstants.maxCycleLength,
            onChanged: (int value) => setState(() => _cycleLength = value),
          ),
          const SizedBox(height: 28),
          NumberStepper(
            label: l10n.periodDurationLabel,
            value: _periodDuration,
            unit: l10n.daysUnit,
            min: AppConstants.minPeriodDuration,
            max: AppConstants.maxPeriodDuration,
            onChanged: (int value) => setState(() => _periodDuration = value),
          ),
        ],
      ),
    );
  }

  Future<void> executePickDate() async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final Locale locale = ref.read(localeControllerProvider);
    final DateTime now = DateTime.now();
    final DateTime? selected = await showDatePicker(
      context: context,
      locale: locale,
      initialDate: _lastPeriodStart,
      firstDate: now.subtract(const Duration(days: 90)),
      lastDate: now,
      helpText: l10n.datePickerHelp,
    );
    if (selected == null) {
      return;
    }
    setState(() => _lastPeriodStart = selected);
  }

  void executeBack() {
    _pageController.previousPage(
      duration: AppConstants.animationDuration,
      curve: AppConstants.animationCurve,
    );
  }

  Future<void> executeContinue() async {
    if (_step < 2) {
      await _pageController.nextPage(
        duration: AppConstants.animationDuration,
        curve: AppConstants.animationCurve,
      );
      return;
    }
    await ref
        .read(calendarControllerProvider.notifier)
        .executeCompleteOnboarding(
          lastPeriodStart: _lastPeriodStart,
          cycleLength: _cycleLength,
          periodDuration: _periodDuration,
        );
  }
}
