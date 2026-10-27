/// API-ключ AppMetrica передаётся при сборке через `--dart-define-from-file`
/// (config/dart_defines/*.json) и не хранится в репозитории.
/// Пустой ключ означает, что аналитика выключена (см. AppMetricaService).
const String kAppMetricaApiKey = String.fromEnvironment(
  'APP_METRICA_API_KEY',
  defaultValue: '',
);
