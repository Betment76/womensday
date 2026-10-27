import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/l10n/app_localizations.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';

/// Кнопка выгрузки PDF для врача.
class ExportDoctorReportButton extends ConsumerStatefulWidget {
  const ExportDoctorReportButton({super.key});

  @override
  ConsumerState<ExportDoctorReportButton> createState() =>
      _ExportDoctorReportButtonState();
}

class _ExportDoctorReportButtonState
    extends ConsumerState<ExportDoctorReportButton> {
  bool _isExporting = false;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FilledButton.icon(
          onPressed: _isExporting ? null : executeExport,
          icon: _isExporting
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Icon(Icons.picture_as_pdf_outlined),
          label: Text(
            _isExporting ? l10n.exportDoctorPdfLoading : l10n.exportDoctorPdf,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.exportDoctorPdfHint,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: SakuraColors.wood),
        ),
      ],
    );
  }

  Future<void> executeExport() async {
    setState(() {
      _isExporting = true;
    });
    try {
      await ref
          .read(calendarControllerProvider.notifier)
          .executeExportDoctorReport();
    } finally {
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    }
  }
}
