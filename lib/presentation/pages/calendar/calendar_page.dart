import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/domain/entities/cycle_forecast.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/widgets/day_details_card.dart';
import 'package:womensday/presentation/widgets/legend_item.dart';
import 'package:womensday/presentation/widgets/section_card.dart';

/// Месячный календарь с фазами цикла.
class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final CycleForecast forecast = ref
        .watch(calendarControllerProvider)
        .forecast;
    final DateTime today = DateTime.now().dateOnly;
    final DateTime selected = ref.watch(selectedCalendarDateProvider);
    ref.listen<DateTime>(selectedCalendarDateProvider, (
      DateTime? previous,
      DateTime next,
    ) {
      if (next.year == _focusedDay.year && next.month == _focusedDay.month) {
        return;
      }
      setState(() => _focusedDay = next);
    });
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Column(
              children: [
                Text(
                  'Календарь',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                SectionCard(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                  child: TableCalendar<void>(
                    locale: 'ru_RU',
                    firstDay: DateTime(2020, 1, 1),
                    lastDay: DateTime(2035, 12, 31),
                    focusedDay: _focusedDay.dateOnly,
                    currentDay: today,
                    rowHeight: 36,
                    daysOfWeekHeight: 18,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      headerPadding: EdgeInsets.zero,
                      titleTextStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: SakuraColors.branch,
                      ),
                      leftChevronMargin: EdgeInsets.zero,
                      rightChevronMargin: EdgeInsets.zero,
                      leftChevronPadding: EdgeInsets.all(4),
                      rightChevronPadding: EdgeInsets.all(4),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: SakuraColors.sakura,
                        size: 22,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: SakuraColors.sakura,
                        size: 22,
                      ),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: SakuraColors.wood,
                      ),
                      weekendStyle: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: SakuraColors.wood,
                      ),
                    ),
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                      cellMargin: EdgeInsets.zero,
                      cellPadding: EdgeInsets.zero,
                      weekendTextStyle: TextStyle(color: SakuraColors.wood),
                    ),
                    selectedDayPredicate: (DateTime day) =>
                        day.isSameDay(selected),
                    onPageChanged: (DateTime focused) {
                      _focusedDay = focused.dateOnly;
                    },
                    onDaySelected: (DateTime nextSelected, DateTime focused) {
                      setState(() => _focusedDay = focused.dateOnly);
                      ref.read(selectedCalendarDateProvider.notifier).state =
                          nextSelected.dateOnly;
                    },
                    calendarBuilders: CalendarBuilders<void>(
                      defaultBuilder:
                          (
                            BuildContext context,
                            DateTime day,
                            DateTime focused,
                          ) {
                            return executeDayCell(
                              day,
                              forecast,
                              isToday: false,
                              isSelected: false,
                            );
                          },
                      todayBuilder:
                          (
                            BuildContext context,
                            DateTime day,
                            DateTime focused,
                          ) {
                            return executeDayCell(
                              day,
                              forecast,
                              isToday: true,
                              isSelected: false,
                            );
                          },
                      selectedBuilder:
                          (
                            BuildContext context,
                            DateTime day,
                            DateTime focused,
                          ) {
                            return executeDayCell(
                              day,
                              forecast,
                              isToday: day.isSameDay(today),
                              isSelected: true,
                            );
                          },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LegendItem(color: SakuraColors.sakura, label: 'Месячные'),
                      SizedBox(width: 12),
                      LegendItem(
                        color: SakuraColors.blossom,
                        label: 'Прогноз',
                        isOutlined: true,
                      ),
                      SizedBox(width: 12),
                      LegendItem(color: SakuraColors.leaf, label: 'Фертильные'),
                      SizedBox(width: 12),
                      LegendItem(
                        color: SakuraColors.ovulation,
                        label: 'Овуляция',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              key: ValueKey<String>('day-scroll-${selected.storageKey}'),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: DayDetailsCard(
                key: ValueKey<String>(selected.storageKey),
                date: selected,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget executeDayCell(
    DateTime day,
    CycleForecast forecast, {
    required bool isToday,
    required bool isSelected,
  }) {
    final DateTime date = day.dateOnly;
    final bool isPeriod = forecast.actualPeriodDays.contains(date);
    final bool isPredicted = forecast.predictedPeriodDays.contains(date);
    final bool isOvulation = forecast.ovulationDays.contains(date);
    final bool isFertile = forecast.fertileDays.contains(date) && !isPeriod;
    Color? fill;
    Color border = Colors.transparent;
    Color text = SakuraColors.branch;
    double borderWidth = 0;
    if (isPeriod) {
      fill = SakuraColors.sakura;
      text = Colors.white;
    } else if (isPredicted) {
      fill = SakuraColors.petal;
      text = SakuraColors.deepBlossom;
    } else if (isOvulation) {
      fill = SakuraColors.ovulation;
      text = Colors.white;
    } else if (isFertile) {
      fill = SakuraColors.leafSoft;
      text = SakuraColors.branch;
    }
    if (isSelected) {
      border = SakuraColors.branch;
      borderWidth = 2.2;
    } else if (isToday) {
      border = SakuraColors.blossom;
      borderWidth = 1.4;
    }
    return Center(
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: fill,
          shape: BoxShape.circle,
          border: Border.all(color: border, width: borderWidth),
        ),
        child: Text(
          '${date.day}',
          style: TextStyle(
            color: text,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
