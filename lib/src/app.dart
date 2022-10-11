import 'package:convenient_test/convenient_test.dart';
import 'package:counter_workshop/flavors.dart';
import 'package:counter_workshop/src/core/routing/router.dart';
import 'package:counter_workshop/src/core/theme/app.theme.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logging/logging.dart';

// ignore: must_be_immutable
class App extends StatefulWidget {
  App({CounterRepository? counterRepository, super.key}) {
    if (counterRepository != null) {
      this.counterRepository = counterRepository;
    }
  }

  CounterRepository counterRepository = CounterRepository(counterApi: CounterFakeApi());

  @override
  State<App> createState() => AppState();

  static AppState of(BuildContext context) => context.findAncestorStateOfType<AppState>()!;
}

class AppState extends State<App> {
  Locale? _locale;
  late final DashboardBloc dashboardBloc;
  final log = Logger('App');

  @override
  void initState() {
    log.info('App Started');

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
    return ConvenientTestWrapperWidget(
      child: MaterialApp.router(
        title: F.title,
        locale: locale,
        theme: appTheme.light,
        darkTheme: appTheme.dark,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
