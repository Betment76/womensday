import 'package:womensday/domain/entities/cycle_report.dart';

/// Контракт выгрузки отчёта для врача.
abstract class DoctorReportExporter {
  Future<void> executeShare(CycleReport report);
}
