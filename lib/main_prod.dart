import 'package:counter_workshop/flavors.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/core/logger/logger.config.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // makes sure plugins are initialized
  Intl.systemLocale = await findSystemLocale(); // Tell the intl package the current system language
  setupLogger(level: Level.INFO); // Setup Logger
  F.appFlavor = Flavor.prod; // Set Flavor
  runApp(
    App(),
  );
}
