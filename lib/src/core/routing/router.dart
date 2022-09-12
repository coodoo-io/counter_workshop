import 'package:counter_workshop/src/features/counter/presentation/view/counter.page.dart';
import 'package:counter_workshop/src/features/settings/presentation/settings.page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation: '/counter',
  routes: [
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CounterPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
