import 'package:counter_workshop/src/core/routing/router.dart';
import 'package:counter_workshop/src/core/theme/app.theme.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  const App({required this.counterRepository, super.key});

  final CounterRepository counterRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final DashboardBloc dashboardBloc;

  @override
  void initState() {
    dashboardBloc = DashboardBloc(counterRepository: widget.counterRepository);
    dashboardBloc.add(FetchCounterList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.counterRepository,
      child: BlocProvider.value(
        value: dashboardBloc,
        child: const AppView(),
      ),
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
