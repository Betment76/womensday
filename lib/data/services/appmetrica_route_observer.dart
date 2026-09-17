import 'dart:async';

import 'package:flutter/material.dart';
import 'package:womensday/core/di/injection.dart';
import 'package:womensday/data/services/appmetrica_service.dart';

/// Просмотры экранов в AppMetrica по имени маршрута.
class AppMetricaRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    executeReport(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      executeReport(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      executeReport(previousRoute);
    }
  }

  void executeReport(Route<dynamic> route) {
    final String? name = route.settings.name;
    if (name == null || name.isEmpty) {
      return;
    }
    unawaited(getIt<AppMetricaService>().executeReportScreen(name));
  }
}
