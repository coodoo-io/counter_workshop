import 'package:counter_workshop/src/core/routing/router.dart';
import 'package:counter_workshop/src/core/theme/app.theme.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  const App({required this.counterRepository, super.key});

  final CounterRepository counterRepository;

  @override
  State<App> createState() => _AppState();

  // ignore: library_private_types_in_public_api
  static _AppState of(BuildContext context) => context.findAncestorStateOfType<_AppState>()!;
}

class _AppState extends State<App> {
  Locale? _locale;
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
        child: AppView(locale: _locale),
      ),
    );
  }

  void setLocale(Locale locale) {
    setState(() => _locale = locale);
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
    required this.locale,
  }) : super(key: key);

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return MaterialApp.router(
      title: 'Counter Demo',
      locale: locale,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.system,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
