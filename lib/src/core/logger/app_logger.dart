import 'package:counter_workshop/src/core/logger/appenders.dart';
import 'package:counter_workshop/src/core/logger/log_formatters.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

final appLogger = Logger('CounterWorkshop');

class AppLogger {
  // ignore: unused_field
  static late AppLogger _singleton;

  factory AppLogger({Level level = Level.ALL}) => _singleton = AppLogger._initLogger(level);

  AppLogger._initLogger(Level level) {
    recordStackTraceAtLevel = level;
    appLogger.info('App Started');
    if (kDebugMode) {
      ConsoleLogAppender(formatter: const ConsoleLogFormatter()).attachToLogger(Logger.root);
      FileLogAppender(formatter: const FileLogFormatter()).attachToLogger(Logger.root);
    }

    if (kReleaseMode) {
      FileLogAppender(formatter: const FileLogFormatter()).attachToLogger(Logger.root);
    }
  }
}
