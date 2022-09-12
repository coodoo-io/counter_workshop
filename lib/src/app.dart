import 'package:counter_workshop/src/core/theme/app.theme.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/counter.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class App extends StatelessWidget {
  const App({required this.counterRepository, super.key});
  final CounterRepository counterRepository;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();

    return FlavorBanner(
        child: MaterialApp(
      title: 'Counter Demo',
      theme: appTheme.light,
      debugShowCheckedModeBanner: FlavorConfig.instance.variables['env'] != 'PRODUCTION',
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.system,
      home: CounterPage(counterRepository: counterRepository),
    ));
  }
}
