import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/l10n/app_localizations.dart';
import 'package:womensday/core/extensions/date_time_extension.dart';
import 'package:womensday/core/utils/service_localizations.dart';
import 'package:womensday/domain/services/reminder_scheduler.dart';

/// Напоминание за день до прогнозируемых месячных.
class NotificationService implements ReminderScheduler {
  NotificationService({this._preferences});

  final SharedPreferences? _preferences;
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _isReady = false;

  Future<void> executeInitialize() async {
    tzdata.initializeTimeZones();
    try {
      final TimezoneInfo timeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZone.identifier));
    } catch (_) {
      tz.setLocalLocation(tz.UTC);
    }
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@drawable/ic_stat_reminder');
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();
    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await _plugin.initialize(settings);
    _isReady = true;
  }

  @override
  Future<void> executeSyncReminder({
    required DateTime? nextPeriodStart,
    required bool areRemindersEnabled,
  }) async {
    if (!_isReady) {
      return;
    }
    await _plugin.cancel(1);
    if (!areRemindersEnabled || nextPeriodStart == null) {
      return;
    }
    await executeRequestPermission();
    final DateTime reminderDate = nextPeriodStart.dateOnly.subtract(
      const Duration(days: AppConstants.reminderDaysBefore),
    );
    final tz.TZDateTime scheduled = tz.TZDateTime(
      tz.local,
      reminderDate.year,
      reminderDate.month,
      reminderDate.day,
      AppConstants.reminderHour,
    );
    if (!scheduled.isAfter(tz.TZDateTime.now(tz.local))) {
      return;
    }
    final AppLocalizations strings = executeResolveLocalizedStrings(
      _preferences,
    );
    await _plugin.zonedSchedule(
      1,
      strings.appName,
      strings.reminderNotificationBody,
      scheduled,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'sakura_cycle',
          strings.reminderTitle,
          channelDescription: strings.reminderSubtitle,
          icon: 'ic_stat_reminder',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  Future<void> executeRequestPermission() async {
    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
    await _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }
}
