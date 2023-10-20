import 'package:counter_workshop/src/features/counter/presentation/dashboard/view/dashboard.page.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/edit_counter.page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
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
            final counterId = state.pathParameters['id'];
            return EditCounterPage(counterId: counterId!);
          },
        ),
      ],
    ),
  ],
);
