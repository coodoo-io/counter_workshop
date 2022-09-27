import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/core/logger/init_logger.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';

Future<void> main() async {
  Intl.systemLocale = await findSystemLocale();
  AppLogger();
  appLogger.info('App Started');
  final CounterRepository counterRepository = CounterRepository(counterApi: CounterFakeApi());

  runApp(
    App(
      counterRepository: counterRepository,
    ),
  );
}
