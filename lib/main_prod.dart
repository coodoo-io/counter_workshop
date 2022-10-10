import 'dart:async';

import 'package:counter_workshop/flavors.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/core/logger/logger.config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized(); // makes sure plugins are initialized
      Intl.systemLocale = await findSystemLocale(); // Tell the intl package the current system language
      setupLogger(level: Level.INFO); // Setup Logger
      F.appFlavor = Flavor.prod; // Set Flavor

      //
      // FIREBASE - CRASHLYTICS
      //
      await Firebase.initializeApp();

      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

      runApp(
        App(),
      );
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}
