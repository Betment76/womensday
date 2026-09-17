/// Контракт напоминания о ближайших месячных.
abstract class ReminderScheduler {
  Future<void> executeSyncReminder({
    required DateTime? nextPeriodStart,
    required bool areRemindersEnabled,
  });
}
