import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/data/services/doctor_pdf_document.dart';
import 'package:womensday/domain/entities/cycle_report.dart';
import 'package:womensday/domain/services/doctor_report_exporter.dart';

/// Сборка PDF и системный лист «Поделиться».
class DoctorPdfService implements DoctorReportExporter {
  ByteData? _regularFont;
  ByteData? _boldFont;

  @override
  Future<void> executeShare(CycleReport report) async {
    final Directory directory = await getTemporaryDirectory();
    final File file = File(
      '${directory.path}/zhenskiy_kalendar_${report.generatedAt.storageKey}.pdf',
    );
    try {
      await executeLoadFonts();
      final DoctorPdfDocument document = DoctorPdfDocument(
        regular: pw.Font.ttf(_regularFont!),
        bold: pw.Font.ttf(_boldFont!),
      );
      final List<int> bytes = await document.executeBuild(report);
      await file.writeAsBytes(bytes, flush: true);
      final ShareResult result = await SharePlus.instance.share(
        ShareParams(
          files: <XFile>[XFile(file.path, mimeType: 'application/pdf')],
          subject: '${AppConstants.appName}: выгрузка для врача',
        ),
      );
      if (result.status == ShareResultStatus.unavailable) {
        throw const FileSystemException('share unavailable');
      }
      await Future<void>.delayed(const Duration(seconds: 2));
    } finally {
      try {
        if (await file.exists()) {
          await file.delete();
        }
      } catch (_) {}
    }
  }

  Future<void> executeLoadFonts() async {
    _regularFont ??= await rootBundle.load('assets/fonts/NotoSans-Regular.ttf');
    _boldFont ??= await rootBundle.load('assets/fonts/NotoSans-Bold.ttf');
  }
}
