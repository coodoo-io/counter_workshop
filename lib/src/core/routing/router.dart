import 'package:counter_workshop/src/features/counter/presentation/dashboard/view/dashboard.page.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/edit_counter.page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: true,
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/counters/new',
      pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: EditCounterPage(),
          ),
    ),
    GoRoute(
      path: '/counters/:id',
      builder: (context, state) {
        final counterId = state.params['id'];
        return EditCounterPage(counterId: counterId);
      },
    ),
  ],
);
