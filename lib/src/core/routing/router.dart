import 'package:counter_workshop/src/features/counter/presentation/dashboard/view/dashboard.page.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/edit_counter.page.dart';
import 'package:counter_workshop/src/features/crashlytics/presentation/crashlytics.page.dart';
import 'package:counter_workshop/src/features/settings/presentation/settings.page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

final router = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: false, // Logs werden durch den Logger übernommen
  initialLocation: '/counters',
  routes: [
    GoRoute(
      path: '/counters',
      builder: (context, state) => const DashboardPage(),
      routes: [
        GoRoute(
          path: 'new',
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: EditCounterPage(),
          ),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final counterId = state.params['id'];
            return EditCounterPage(counterId: counterId!);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/crashlytics',
      builder: (context, state) => const CrashlyticsPage(),
    )
  ],
  observers: [
    GoRouterObserver(analytics: FirebaseAnalytics.instance),
    //FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
  ],
);

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver({required this.analytics});
  final FirebaseAnalytics analytics;
  final log = Logger('GoRouter');

  @override
  Future<void> didPush(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    String page = router.location;
    await analytics.setCurrentScreen(screenName: page);
    log.info('Going to: $page');
  }

  @override
  Future<void> didPop(Route route, Route? previousRoute) async {
    String page = router.location;
    await analytics.setCurrentScreen(screenName: page);
    log.info('Back to: $page');
    super.didPop(route, previousRoute);
  }
}
