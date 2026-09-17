import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:womensday/data/services/doctor_pdf_document.dart';
import 'package:womensday/domain/entities/calendar_data.dart';
import 'package:womensday/domain/entities/cycle_forecast.dart';
import 'package:womensday/domain/entities/cycle_phase.dart';
import 'package:womensday/domain/entities/cycle_regularity.dart';
import 'package:womensday/domain/entities/cycle_settings.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/domain/entities/period_cycle.dart';
import 'package:womensday/domain/services/cycle_report_builder.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('PDF собирается из шрифтов и отчёта', () async {
    final Uint8List regularBytes =
        await File('assets/fonts/NotoSans-Regular.ttf').readAsBytes();
    final Uint8List boldBytes =
        await File('assets/fonts/NotoSans-Bold.ttf').readAsBytes();
    final ByteData regularData = ByteData.sublistView(regularBytes);
    final ByteData boldData = ByteData.sublistView(boldBytes);
    final DateTime today = DateTime(2026, 9, 7);
    final DateTime start = DateTime(2026, 9, 1);
    final CycleReportBuilder builder = CycleReportBuilder();
    final report = builder.executeBuild(
      data: CalendarData(
        isOnboardingCompleted: true,
        settings: CycleSettings.createDefault(),
        logs: <String, DayLog>{
          '2026-09-01': DayLog(date: start, isPeriod: true, note: 'тест'),
        },
      ),
      forecast: CycleForecast(
        cycles: <PeriodCycle>[
          PeriodCycle(start: start, end: DateTime(2026, 9, 5)),
        ],
        averageCycleLength: 28,
        averagePeriodDuration: 5,
        actualPeriodDays: <DateTime>{},
        predictedPeriodDays: <DateTime>{},
        ovulationDays: <DateTime>{},
        fertileDays: <DateTime>{},
        currentPhase: CyclePhase.menstruation,
        cycleDay: 7,
        daysUntilPeriod: 0,
        isLate: false,
        regularity: CycleRegularity.unknown,
      ),
      generatedAt: today,
      today: today,
    );
    final DoctorPdfDocument document = DoctorPdfDocument(
      regular: pw.Font.ttf(regularData),
      bold: pw.Font.ttf(boldData),
    );
    final List<int> bytes = await document.executeBuild(report);
    expect(bytes.length, greaterThan(1000));
  });
}
