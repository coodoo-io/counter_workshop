import 'package:counter_workshop/src/core/routing/router.dart';
import 'package:counter_workshop/src/core/theme/app.theme.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({required this.counterRepository, super.key});

  final CounterRepository counterRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: counterRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return MaterialApp.router(
      title: 'Counter Demo',
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.system,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
