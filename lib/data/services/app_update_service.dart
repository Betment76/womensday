/// Проверка обновлений в магазине приложения.
abstract class AppUpdateService {
  /// Одна проверка за запуск; при наличии обновления запускает установку.
  Future<void> executeCheckAndApply();
}
