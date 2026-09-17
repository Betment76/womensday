import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
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
                    AppConstants.appName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    AppConstants.appSubtitle,
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
                  child: Text(_step == 2 ? 'Начать' : 'Далее'),
                ),
                if (_step > 0) ...[
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: executeBack,
                    child: const Text('Назад'),
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
    return const SectionCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Тихий календарь для себя',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: SakuraColors.branch,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Отмечайте месячные в одно касание. Прогноз, овуляция и самочувствие остаются только на этом устройстве.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget executeDateStep(BuildContext context) {
    final String label = DateFormat(
      'd MMMM yyyy',
      'ru',
    ).format(_lastPeriodStart);
    return SectionCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Когда начались последние месячные?',
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
            child: const Text('Выбрать дату'),
          ),
        ],
      ),
    );
  }

  Widget executeCycleStep(BuildContext context) {
    return SectionCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberStepper(
            label: 'Обычная длина цикла',
            value: _cycleLength,
            min: AppConstants.minCycleLength,
            max: AppConstants.maxCycleLength,
            onChanged: (int value) => setState(() => _cycleLength = value),
          ),
          const SizedBox(height: 28),
          NumberStepper(
            label: 'Длительность месячных',
            value: _periodDuration,
            min: AppConstants.minPeriodDuration,
            max: AppConstants.maxPeriodDuration,
            onChanged: (int value) => setState(() => _periodDuration = value),
          ),
        ],
      ),
    );
  }

  Future<void> executePickDate() async {
    final DateTime now = DateTime.now();
    final DateTime? selected = await showDatePicker(
      context: context,
      locale: const Locale('ru'),
      initialDate: _lastPeriodStart,
      firstDate: now.subtract(const Duration(days: 90)),
      lastDate: now,
      helpText: 'Начало последних месячных',
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
