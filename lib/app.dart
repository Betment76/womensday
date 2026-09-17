import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:womensday/core/constants/app_constants.dart';
import 'package:womensday/core/router/app_router.dart';
import 'package:womensday/core/theme/app_theme.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/controllers/premium_controller.dart';

/// Корневой виджет приложения.
class SakuraApp extends ConsumerStatefulWidget {
  const SakuraApp({super.key});

  @override
  ConsumerState<SakuraApp> createState() => _SakuraAppState();
}

class _SakuraAppState extends ConsumerState<SakuraApp>
    with WidgetsBindingObserver {
  final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      imageCache.clear();
      imageCache.clearLiveImages();
    }
    if (state == AppLifecycleState.resumed) {
      unawaited(
        ref.read(premiumControllerProvider.notifier).executeReconcile(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = ref.watch(goRouterProvider);
    ref.listen<CalendarState>(calendarControllerProvider, (
      CalendarState? previous,
      CalendarState next,
    ) {
      final String? message = next.persistErrorMessage;
      if (message == null || message == previous?.persistErrorMessage) {
        return;
      }
      _messengerKey.currentState?.showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.createLightTheme(),
      locale: const Locale('ru'),
      supportedLocales: const <Locale>[Locale('ru'), Locale('en')],
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      scaffoldMessengerKey: _messengerKey,
      routerConfig: router,
    );
  }
}
