import 'package:counter_workshop/src/features/counter/presentation/dashboard/view/dashboard.page.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/edit_counter.page.dart';
import 'package:counter_workshop/src/features/settings/presentation/settings.page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: false,
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
    )
  ],
);
