import 'package:counter_workshop/src/core/logger/logger.formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

setupLogger({Level level = Level.INFO}) {
  debugPrint('Log-Level: ${level.name}');
  Logger.root.level = level;
  if (kDebugMode) {
    // Development Logging
    PrintAppender(formatter: const CustomLogFormatter(colorsEnabled: true)).attachToLogger(Logger.root);
  } else {
    if (!kIsWeb) {
      // Release Logging
      RotatingFileAppender(
              formatter: const CustomLogFormatter(colorsEnabled: false), baseFilePath: '/counter_workshop_logs')
          .attachToLogger(Logger.root);
    }
  }
}
