import 'package:flutter/foundation.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:womensday/data/services/app_update_service.dart';

/// Отложенное обновление через Google Play In-App Updates.
class GooglePlayUpdateService implements AppUpdateService {
  bool _isChecked = false;

  @override
  Future<void> executeCheckAndApply() async {
    if (_isChecked || !kReleaseMode) {
      return;
    }
    _isChecked = true;
    try {
      final AppUpdateInfo info = await InAppUpdate.checkForUpdate();
      if (info.installStatus == InstallStatus.downloaded) {
        await InAppUpdate.completeFlexibleUpdate();
        return;
      }
      if (info.updateAvailability != UpdateAvailability.updateAvailable &&
          info.updateAvailability !=
              UpdateAvailability.developerTriggeredUpdateInProgress) {
        return;
      }
      if (info.flexibleUpdateAllowed) {
        final AppUpdateResult result = await InAppUpdate.startFlexibleUpdate();
        if (result == AppUpdateResult.success) {
          await InAppUpdate.completeFlexibleUpdate();
        }
        return;
      }
      if (info.immediateUpdateAllowed) {
        await InAppUpdate.performImmediateUpdate();
      }
    } catch (_) {
      // Обновление не должно мешать запуску приложения.
    }
  }
}
