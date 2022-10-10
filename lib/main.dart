import 'package:counter_workshop/firebase_options.dart';
import 'package:counter_workshop/flavors.dart';
import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/core/logger/logger.config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:logging/logging.dart';

// Still here because Fluter on Desktop does not Support Flavors see [https://github.com/flutter/flutter/issues/64088]
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // makes sure plugins are initialized
  Intl.systemLocale = await findSystemLocale(); // Tell the intl package the current system language
  setupLogger(level: Level.INFO); // Setup Logger
  F.appFlavor = Flavor.stage; // Set Flavor

  //
  // FIREBASE
  //
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    App(),
  );
}
