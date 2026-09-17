import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:womensday/core/constants/legal_documents.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/data/services/appmetrica_route_observer.dart';
import 'package:womensday/domain/entities/payment_session.dart';
import 'package:womensday/presentation/controllers/calendar_controller.dart';
import 'package:womensday/presentation/pages/about/about_page.dart';
import 'package:womensday/presentation/pages/about/legal_document_page.dart';
import 'package:womensday/presentation/pages/calendar/calendar_page.dart';
import 'package:womensday/presentation/pages/onboarding/onboarding_page.dart';
import 'package:womensday/presentation/pages/payment/payment_page.dart';
import 'package:womensday/presentation/pages/settings/settings_page.dart';
import 'package:womensday/presentation/pages/shell/app_shell_page.dart';
import 'package:womensday/presentation/pages/splash/splash_page.dart';
import 'package:womensday/presentation/pages/stats/stats_page.dart';
import 'package:womensday/presentation/pages/today/today_page.dart';

/// Маршрутизатор приложения.
final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((Ref ref) {
  final ValueNotifier<int> refresh = ValueNotifier<int>(0);
  ref.listen<CalendarState>(calendarControllerProvider, (
    CalendarState? previous,
    CalendarState next,
  ) {
    if (previous == null) {
      return;
    }
    final bool previousGate = executeNeedsRouterRefresh(previous);
    final bool nextGate = executeNeedsRouterRefresh(next);
    if (previousGate != nextGate) {
      refresh.value++;
    }
  });
  ref.onDispose(refresh.dispose);
  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: refresh,
    observers: <NavigatorObserver>[AppMetricaRouteObserver()],
    redirect: (BuildContext context, GoRouterState state) {
      final CalendarState calendar = ref.read(calendarControllerProvider);
      final String location = state.matchedLocation;
      if (calendar.isLoading || calendar.hasLoadError) {
        return location == '/splash' ? null : '/splash';
      }
      if (!calendar.data.isOnboardingCompleted) {
        return location == '/onboarding' ? null : '/onboarding';
      }
      if (location == '/splash' || location == '/onboarding') {
        return '/today';
      }
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (BuildContext context, GoRouterState state) {
          final CalendarState calendar = ref.read(calendarControllerProvider);
          return SplashPage(
            errorMessage: calendar.errorMessage,
            onRetry: () {
              ref.read(calendarControllerProvider.notifier).executeLoad();
            },
          );
        },
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingPage();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) {
              return AppShellPage(navigationShell: navigationShell);
            },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/today',
                name: 'today',
                builder: (BuildContext context, GoRouterState state) {
                  return const TodayPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/calendar',
                name: 'calendar',
                builder: (BuildContext context, GoRouterState state) {
                  return const CalendarPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/stats',
                name: 'stats',
                builder: (BuildContext context, GoRouterState state) {
                  return const StatsPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (BuildContext context, GoRouterState state) {
                  return const SettingsPage();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/about',
        name: 'about',
        builder: (BuildContext context, GoRouterState state) {
          return const AboutPage();
        },
      ),
      GoRoute(
        path: '/payment',
        name: 'payment',
        builder: (BuildContext context, GoRouterState state) {
          final Object? extra = state.extra;
          if (extra is! PaymentSession) {
            return const Scaffold(
              body: Center(child: Text('Сессия оплаты не найдена')),
            );
          }
          return Scaffold(
            backgroundColor: SakuraColors.mist,
            body: Align(
              alignment: Alignment.bottomCenter,
              child: PaymentPage(session: extra),
            ),
          );
        },
      ),
      GoRoute(
        path: '/legal',
        name: 'legal',
        builder: (BuildContext context, GoRouterState state) {
          final Object? extra = state.extra;
          final LegalDocument document = extra is LegalDocument
              ? extra
              : LegalDocuments.all.first;
          return LegalDocumentPage(
            title: document.title,
            assetPath: document.assetPath,
          );
        },
      ),
    ],
  );
});

bool executeNeedsRouterRefresh(CalendarState state) {
  return state.isLoading ||
      state.hasLoadError ||
      !state.data.isOnboardingCompleted;
}
