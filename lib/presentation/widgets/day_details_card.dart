import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/data/services/yandex_ads_service.dart';
import 'package:womensday/domain/entities/day_log.dart';
import 'package:womensday/domain/entities/flow_intensity.dart';
import 'package:womensday/domain/entities/mood.dart';
import 'package:womensday/domain/entities/symptom.dart';
import 'package:womensday/l10n/app_localizations.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/controllers/locale_controller.dart';
import 'package:womensday/presentation/widgets/capsule_switch.dart';
import 'package:womensday/presentation/widgets/mood_picker.dart';
import 'package:womensday/presentation/widgets/section_card.dart';
import 'package:womensday/presentation/widgets/symptom_picker.dart';

/// Карточка одного дня: месячные, симптомы, заметка.
class DayDetailsCard extends ConsumerStatefulWidget {
  const DayDetailsCard({
    super.key,
    required this.date,
    this.showDateTitle = true,
    this.noteMaxLines = 4,
    this.expandNote = false,
    this.isCompact = false,
    this.showSaveButton = false,
    this.fillAvailableHeight = false,
    this.leading,
  });

  final DateTime date;
  final bool showDateTitle;
  final int noteMaxLines;
  final bool expandNote;
  final bool isCompact;
  final bool showSaveButton;
  final bool fillAvailableHeight;
  final Widget? leading;

  @override
  ConsumerState<DayDetailsCard> createState() => _DayDetailsCardState();
}

class _DayDetailsCardState extends ConsumerState<DayDetailsCard> {
  // Захватывается в initState: ref.read в dispose запрещён (элемент уже
  // размонтируется), а флаш заметки должен сохранить несохранённый текст.
  late final CalendarController _calendar;
  late final TextEditingController _noteController;
  late final FocusNode _noteFocusNode;
  final GlobalKey _noteKey = GlobalKey();
  Timer? _noteDebounce;
  bool _isSaving = false;
  DayLog? _savedLog;

  @override
  void initState() {
    super.initState();
    _calendar = ref.read(calendarControllerProvider.notifier);
    final DayLog log = _calendar.executeReadLog(widget.date);
    _savedLog = log;
    _noteController = TextEditingController(text: log.note);
    _noteFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _noteDebounce?.cancel();
    executeFlushNote();
    _noteFocusNode.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String localeTag = ref.watch(localeControllerProvider).languageCode;
    ref.watch(calendarControllerProvider);
    final DayLog log = _calendar.executeReadLog(widget.date);
    final double gap = widget.isCompact ? 8 : 12;
    if (widget.fillAvailableHeight && widget.showSaveButton) {
      return executeFillHeightLayout(l10n, log, gap);
    }
    final List<Widget> fields = <Widget>[
      if (widget.showDateTitle) ...[
        Text(
          DateFormat('d MMMM yyyy', localeTag).format(widget.date),
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
        SizedBox(height: gap),
      ],
      executePeriodCard(l10n, log),
      if (log.isPeriod) ...[SizedBox(height: gap), executeFlowCard(l10n, log)],
      SizedBox(height: gap),
      SectionCard(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.mood,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            ),
            const SizedBox(height: 4),
            MoodPicker(
              selected: log.mood,
              faceSize: widget.isCompact ? 40 : 48,
              onSelected: (Mood? value) {
                executeSave(
                  log.copyWith(mood: value, clearMood: value == null),
                );
              },
            ),
          ],
        ),
      ),
      SizedBox(height: gap),
      SectionCard(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.wellbeing,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            ),
            const SizedBox(height: 4),
            SymptomPicker(
              selected: log.symptoms,
              onChanged: (List<Symptom> next) {
                executeSave(log.copyWith(symptoms: next));
              },
            ),
          ],
        ),
      ),
      SizedBox(height: gap),
      KeyedSubtree(key: _noteKey, child: executeNoteCard(l10n)),
    ];
    final Widget fieldsColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: fields,
    );
    if (!widget.showSaveButton) {
      return fieldsColumn;
    }
    return executeTodayStack(
      l10n: l10n,
      log: log,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: fieldsColumn,
      ),
    );
  }

  Widget executeFillHeightLayout(
    AppLocalizations l10n,
    DayLog log,
    double gap,
  ) {
    return executeTodayStack(
      l10n: l10n,
      log: log,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.leading != null) Expanded(flex: 2, child: widget.leading!),
          SizedBox(height: gap),
          executePeriodCard(l10n, log),
          if (log.isPeriod) ...[
            SizedBox(height: gap),
            executeFlowCard(l10n, log),
          ],
          SizedBox(height: gap),
          Expanded(flex: 3, child: executeMoodCard(l10n, log, fill: true)),
          SizedBox(height: gap),
          Expanded(flex: 2, child: executeSymptomsCard(l10n, log, fill: true)),
          SizedBox(height: gap),
          Expanded(
            flex: 1,
            child: KeyedSubtree(
              key: _noteKey,
              child: executeNoteCard(l10n, fill: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget executeTodayStack({
    required AppLocalizations l10n,
    required DayLog log,
    required Widget body,
  }) {
    final bool hasPendingSave = executeHasPendingSave(log);
    final double keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final double saveButtonGap = hasPendingSave ? 56 : 0;
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned.fill(
          child: AnimatedPadding(
            duration: AppConstants.animationDuration,
            curve: AppConstants.animationCurve,
            padding: EdgeInsets.only(bottom: saveButtonGap + keyboardInset),
            child: body,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: IgnorePointer(
            ignoring: !hasPendingSave,
            child: AnimatedSlide(
              duration: AppConstants.animationDuration,
              curve: AppConstants.animationCurve,
              offset: hasPendingSave ? Offset.zero : const Offset(0, 1.15),
              child: executeSaveButton(l10n),
            ),
          ),
        ),
      ],
    );
  }

  Widget executePeriodCard(AppLocalizations l10n, DayLog log) {
    return SectionCard(
      padding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              l10n.period,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          CapsuleSwitch(
            value: log.isPeriod,
            onChanged: (_) => _calendar.executeTogglePeriod(widget.date),
          ),
        ],
      ),
    );
  }

  Widget executeFlowCard(AppLocalizations l10n, DayLog log) {
    return SectionCard(
      padding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
      child: Row(
        children: [
          Text(l10n.flow, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(width: 8),
          Expanded(child: executeFlowButton(l10n, log, FlowIntensity.light)),
          const SizedBox(width: 6),
          Expanded(child: executeFlowButton(l10n, log, FlowIntensity.medium)),
          const SizedBox(width: 6),
          Expanded(child: executeFlowButton(l10n, log, FlowIntensity.heavy)),
        ],
      ),
    );
  }

  Widget executeMoodCard(
    AppLocalizations l10n,
    DayLog log, {
    required bool fill,
  }) {
    return SectionCard(
      expand: fill,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.mood,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: MoodPicker(
              selected: log.mood,
              faceSize: 56,
              onSelected: (Mood? value) {
                executeSave(
                  log.copyWith(mood: value, clearMood: value == null),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget executeSymptomsCard(
    AppLocalizations l10n,
    DayLog log, {
    required bool fill,
  }) {
    return SectionCard(
      expand: fill,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.wellbeing,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SymptomPicker(
                selected: log.symptoms,
                onChanged: (List<Symptom> next) {
                  executeSave(log.copyWith(symptoms: next));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget executeSaveButton(AppLocalizations l10n) {
    return FilledButton(
      onPressed: _isSaving ? null : () => unawaited(executeSaveWithAd()),
      child: _isSaving
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(l10n.save),
    );
  }

  Widget executeNoteCard(AppLocalizations l10n, {bool fill = false}) {
    final bool isExpanded = widget.expandNote || fill;
    final Widget field = TextField(
      controller: _noteController,
      focusNode: _noteFocusNode,
      expands: isExpanded,
      minLines: isExpanded ? null : widget.noteMaxLines,
      maxLines: isExpanded ? null : widget.noteMaxLines,
      scrollPadding: const EdgeInsets.fromLTRB(20, 24, 20, 80),
      textAlignVertical: isExpanded
          ? TextAlignVertical.top
          : TextAlignVertical.center,
      textInputAction: isExpanded
          ? TextInputAction.newline
          : TextInputAction.done,
      decoration: InputDecoration(
        hintText: isExpanded || widget.noteMaxLines == 1
            ? l10n.noteHint
            : l10n.noteHintShort,
        labelText: isExpanded || widget.noteMaxLines == 1
            ? null
            : l10n.noteHint,
        alignLabelWithHint: true,
        border: InputBorder.none,
        isDense: !isExpanded && widget.noteMaxLines == 1,
        contentPadding: !isExpanded && widget.noteMaxLines == 1
            ? const EdgeInsets.symmetric(vertical: 8)
            : EdgeInsets.zero,
      ),
      onChanged: executeScheduleNoteSave,
    );
    final Widget card = SectionCard(
      expand: isExpanded,
      padding: isExpanded
          ? const EdgeInsets.fromLTRB(16, 12, 16, 12)
          : widget.noteMaxLines == 1
          ? const EdgeInsets.fromLTRB(16, 4, 16, 4)
          : EdgeInsets.all(widget.isCompact ? 12 : 20),
      child: isExpanded ? SizedBox.expand(child: field) : field,
    );
    if (isExpanded && !fill) {
      return Expanded(child: card);
    }
    return card;
  }

  Widget executeFlowButton(
    AppLocalizations l10n,
    DayLog log,
    FlowIntensity value,
  ) {
    final bool isSelected = log.flow == value;
    final Color dropColor = isSelected
        ? SakuraColors.sakura
        : SakuraColors.wood;
    return Tooltip(
      message: l10n.flowTitle(value),
      child: InkWell(
        onTap: () {
          executeSave(
            log.copyWith(
              flow: isSelected ? null : value,
              clearFlow: isSelected,
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: AppConstants.animationDuration,
          curve: AppConstants.animationCurve,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? SakuraColors.petal : SakuraColors.cream,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? SakuraColors.sakura : SakuraColors.petal,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < value.dropCount; i++)
                  Icon(Icons.water_drop, size: 14, color: dropColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> executeSaveWithAd() async {
    if (_isSaving) {
      return;
    }
    setState(() => _isSaving = true);
    _noteDebounce?.cancel();
    executeFlushNote();
    final DayLog confirmed = executeCurrentMarks(
      _calendar.executeReadLog(widget.date),
    );
    await getIt<YandexAdsService>().executeShowInterstitial();
    if (!mounted) {
      return;
    }
    setState(() {
      _isSaving = false;
      _savedLog = confirmed;
    });
    executeOpenCalendar();
  }

  void executeOpenCalendar() {
    ref.read(selectedCalendarDateProvider.notifier).state =
        widget.date.dateOnly;
    final StatefulNavigationShellState? shell = StatefulNavigationShell.maybeOf(
      context,
    );
    if (shell == null) {
      context.go('/calendar');
      return;
    }
    shell.goBranch(1);
  }

  void executeScheduleNoteSave(String value) {
    _noteDebounce?.cancel();
    _noteDebounce = Timer(
      const Duration(milliseconds: AppConstants.noteSaveDebounceMs),
      executeFlushNote,
    );
    setState(() {});
  }

  DayLog executeCurrentMarks(DayLog log) {
    return log.copyWith(note: _noteController.text);
  }

  DayLog executeSavedLog(DayLog log) {
    final DayLog saved = _savedLog ?? executeCurrentMarks(log);
    _savedLog = saved;
    return saved;
  }

  bool executeHasPendingSave(DayLog log) {
    return !executeCurrentMarks(log).isSameAs(executeSavedLog(log));
  }

  void executeFlushNote() {
    final DayLog current = _calendar.executeReadLog(widget.date);
    if (current.note == _noteController.text) {
      return;
    }
    executeSave(current.copyWith(note: _noteController.text));
  }

  void executeSave(DayLog log) {
    _calendar.executeSaveDayLog(log);
  }
}
