import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/core/extensions/plural_extension.dart';
import 'package:womensday/domain/entities/cycle_report.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/period_cycle.dart';
import 'package:womensday/domain/entities/symptom.dart';

/// Вёрстка PDF-отчёта для врача.
class DoctorPdfDocument {
  DoctorPdfDocument({required this.regular, required this.bold});

  final pw.Font regular;
  final pw.Font bold;

  static const PdfColor _branch = PdfColor.fromInt(0xFF5D4037);
  static const PdfColor _sakura = PdfColor.fromInt(0xFFE85A8C);
  static const PdfColor _headerFill = PdfColor.fromInt(0xFFFFD6E3);
  static const pw.EdgeInsets _tableCellPadding = pw.EdgeInsets.symmetric(
    horizontal: 4,
    vertical: 4,
  );

  Future<List<int>> executeBuild(CycleReport report) {
    final pw.Document document = pw.Document(
      theme: pw.ThemeData.withFont(base: regular, bold: bold),
    );
    document.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.fromLTRB(36, 36, 36, 40),
        header: executeHeader,
        footer: executeFooter,
        build: (pw.Context context) {
          return <pw.Widget>[
            executeTitle(report),
            pw.SizedBox(height: 10),
            executeDisclaimer(),
            pw.SizedBox(height: 16),
            executeSummary(report),
            pw.SizedBox(height: 18),
            executeSectionTitle('Циклы'),
            pw.SizedBox(height: 8),
            executeCyclesTable(report),
            pw.SizedBox(height: 18),
            executeSectionTitle('Дневник'),
            pw.SizedBox(height: 8),
            executeLogsTable(report),
          ];
        },
      ),
    );
    return document.save();
  }

  /// Слова «Слабые / Обычные / Обильные», не капли.
  String executeFlowWords(FlowIntensity? flow) {
    if (flow == null) {
      return '-';
    }
    return flow.title;
  }

  pw.Widget executeTitle(CycleReport report) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          AppConstants.appName,
          style: pw.TextStyle(font: bold, fontSize: 18, color: _sakura),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          'Выгрузка для врача - ${report.generatedAt.storageKey}',
          style: pw.TextStyle(font: regular, fontSize: 11, color: _branch),
        ),
      ],
    );
  }

  pw.Widget executeDisclaimer() {
    return pw.Text(
      'Документ собран из отметок пользователя на устройстве. Это не медицинское заключение и не диагноз.',
      style: pw.TextStyle(
        font: regular,
        fontSize: 9,
        color: _branch,
        lineSpacing: 2,
      ),
    );
  }

  pw.Widget executeSummary(CycleReport report) {
    return pw.Row(
      children: [
        executeSummaryTile(
          'Длина цикла',
          '${report.averageCycleLength} ${executePluralDays(report.averageCycleLength)}',
        ),
        pw.SizedBox(width: 12),
        executeSummaryTile(
          'Месячные',
          '${report.averagePeriodDuration} ${executePluralDays(report.averagePeriodDuration)}',
        ),
        pw.SizedBox(width: 12),
        executeSummaryTile('Регулярность', report.regularity.title),
      ],
    );
  }

  pw.Widget executeSummaryTile(String label, String value) {
    return pw.Expanded(
      child: pw.Container(
        padding: const pw.EdgeInsets.all(8),
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: _headerFill),
          borderRadius: pw.BorderRadius.circular(6),
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              label,
              style: pw.TextStyle(font: regular, fontSize: 8, color: _branch),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              value,
              style: pw.TextStyle(font: bold, fontSize: 11, color: _branch),
            ),
          ],
        ),
      ),
    );
  }

  pw.Widget executeSectionTitle(String title) {
    return pw.Text(
      title,
      style: pw.TextStyle(font: bold, fontSize: 13, color: _branch),
    );
  }

  pw.Widget executeCyclesTable(CycleReport report) {
    if (report.cycles.isEmpty) {
      return pw.Text(
        'Циклы ещё не отмечены.',
        style: pw.TextStyle(font: regular, fontSize: 10, color: _branch),
      );
    }
    return executeTable(
      headers: <String>['Начало', 'Конец', 'Месячные', 'Длина цикла'],
      rows: report.cycles.reversed
          .map(
            (PeriodCycle cycle) => <String>[
              cycle.start.storageKey,
              cycle.end.storageKey,
              '${cycle.duration} ${executePluralDays(cycle.duration)}',
              cycle.lengthToNext == null
                  ? 'текущий'
                  : '${cycle.lengthToNext} ${executePluralDays(cycle.lengthToNext!)}',
            ],
          )
          .toList(),
    );
  }

  pw.Widget executeLogsTable(CycleReport report) {
    if (report.logs.isEmpty) {
      return pw.Text(
        'В дневнике нет отметок за этот период.',
        style: pw.TextStyle(font: regular, fontSize: 10, color: _branch),
      );
    }
    final List<String> headers = <String>[
      'Дата',
      'Месячные',
      'Выделения',
      'Настроение',
      'Самочувствие',
      'Заметка',
    ];
    final pw.TextStyle headerStyle = pw.TextStyle(
      font: bold,
      fontSize: 8,
      color: _branch,
    );
    return executeTable(
      headers: headers,
      rows: report.logs.map(executeLogRow).toList(),
      headerStyle: headerStyle,
      columnWidths: <int, pw.TableColumnWidth>{
        0: _GuideColumnWidth(
          guides: const <String>['Дата', '0000-00-00'],
          style: headerStyle,
        ),
        1: _GuideColumnWidth(
          guides: const <String>['Месячные'],
          style: headerStyle,
        ),
        2: _GuideColumnWidth(
          guides: const <String>['Выделения', 'Слабые', 'Обычные', 'Обильные'],
          style: headerStyle,
        ),
        3: _GuideColumnWidth(
          guides: const <String>['Настроение'],
          style: headerStyle,
        ),
        4: _GuideColumnWidth(
          guides: const <String>['Самочувствие'],
          style: headerStyle,
        ),
        5: const pw.FlexColumnWidth(),
      },
    );
  }

  List<String> executeLogRow(DayLog log) {
    return <String>[
      log.date.storageKey,
      log.isPeriod ? 'да' : 'нет',
      executeFlowWords(log.flow),
      log.mood?.title ?? '-',
      log.symptoms.isEmpty
          ? '-'
          : log.symptoms.map((Symptom item) => item.title).join(', '),
      log.note.trim().isEmpty ? '-' : log.note.trim(),
    ];
  }

  pw.Widget executeTable({
    required List<String> headers,
    required List<List<String>> rows,
    pw.TextStyle? headerStyle,
    Map<int, pw.TableColumnWidth>? columnWidths,
  }) {
    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: rows,
      headerStyle:
          headerStyle ?? pw.TextStyle(font: bold, fontSize: 8, color: _branch),
      cellStyle: pw.TextStyle(font: regular, fontSize: 8, color: _branch),
      headerDecoration: const pw.BoxDecoration(color: _headerFill),
      headerAlignment: pw.Alignment.centerLeft,
      cellAlignment: pw.Alignment.topLeft,
      cellPadding: _tableCellPadding,
      columnWidths: columnWidths,
      border: pw.TableBorder.all(color: _headerFill, width: 0.6),
    );
  }

  pw.Widget executeHeader(pw.Context context) {
    if (context.pageNumber == 1) {
      return pw.SizedBox();
    }
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            AppConstants.appName,
            style: pw.TextStyle(font: bold, fontSize: 9, color: _sakura),
          ),
          pw.Text(
            'Дневник, продолжение',
            style: pw.TextStyle(font: regular, fontSize: 8, color: _branch),
          ),
        ],
      ),
    );
  }

  pw.Widget executeFooter(pw.Context context) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Text(
        'Стр. ${context.pageNumber} из ${context.pagesCount}',
        style: pw.TextStyle(font: regular, fontSize: 8, color: _branch),
      ),
    );
  }
}

/// Ширина колонки по самому длинному заголовку-ориентиру, без растягивания от ячеек.
class _GuideColumnWidth extends pw.TableColumnWidth {
  _GuideColumnWidth({required this.guides, required this.style});

  final List<String> guides;
  final pw.TextStyle style;
  double? _width;

  @override
  pw.ColumnLayout layout(
    pw.Widget child,
    pw.Context context,
    pw.BoxConstraints constraints,
  ) {
    final double width = _width ?? executeMeasure(context);
    _width = width;
    return pw.ColumnLayout(width, 0);
  }

  double executeMeasure(pw.Context context) {
    double maxWidth = 0;
    for (final String guide in guides) {
      final pw.Widget probe = pw.Padding(
        padding: DoctorPdfDocument._tableCellPadding,
        child: pw.Text(guide, style: style, softWrap: false, maxLines: 1),
      );
      probe.layout(context, const pw.BoxConstraints());
      final double width = probe.box!.width;
      if (width > maxWidth) {
        maxWidth = width;
      }
    }
    return maxWidth + 1;
  }
}
