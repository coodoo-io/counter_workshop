import 'dart:developer';

import 'package:counter_workshop/src/core/logger/log_formatters.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

class AppDevLogAppender extends BaseLogAppender {
  // void Function(Object line)? printer;

  AppDevLogAppender({LogRecordFormatter? formatter}) : super(formatter ?? defaultLogRecordFormatter());

  AppDevLogAppender setupLogging({Level level = Level.ALL, Level stderrLevel = Level.OFF}) {
    Logger.root.clearListeners();
    Logger.root.level = level;

    return defaultLogAppender(stderrLevel: stderrLevel)..attachToLogger(Logger.root);
  }

  @override
  void handle(LogRecord record) {
    log(formatter.format(record));
  }
}

AppDevLogAppender defaultLogAppender({LogRecordFormatter? formatter, Level? stderrLevel}) {
  return AppDevLogAppender(formatter: formatter);
}

// Realse Appender ####################################################################################################

class AppReleaseLogAppender extends BaseLogAppender {
  void Function(Object line)? printer;

  AppReleaseLogAppender({LogRecordFormatter? formatter}) : super(formatter ?? defaultReleaseLogRecordFormatter());

  AppReleaseLogAppender setupLogging({Level level = Level.ALL, Level stderrLevel = Level.OFF}) {
    Logger.root.clearListeners();
    Logger.root.level = level;

    return defaultReleaseLogAppender(stderrLevel: stderrLevel)..attachToLogger(Logger.root);
  }

  @override
  void handle(LogRecord record) {
    log(formatter.format(record));
  }
}

AppReleaseLogAppender defaultReleaseLogAppender({LogRecordFormatter? formatter, Level? stderrLevel}) {
  return AppReleaseLogAppender(formatter: formatter);
}
