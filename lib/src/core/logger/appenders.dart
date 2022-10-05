import 'dart:developer';

import 'package:counter_workshop/src/core/logger/log_formatters.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

class ConsoleLogAppender extends BaseLogAppender {
  void Function(Object line)? printer;

  ConsoleLogAppender({LogRecordFormatter? formatter}) : super(formatter ?? defaultDebugConsoleLogFormatter());

  ConsoleLogAppender setupLogging({Level level = Level.ALL, Level stderrLevel = Level.OFF}) {
    Logger.root.clearListeners();
    Logger.root.level = level;

    return defaultLogAppender(stderrLevel: stderrLevel)..attachToLogger(Logger.root);
  }

  @override
  void handle(LogRecord record) {
    log(formatter.format(record));
  }
}

ConsoleLogAppender defaultLogAppender({LogRecordFormatter? formatter, Level? stderrLevel}) {
  return ConsoleLogAppender(formatter: formatter);
}

class FileLogAppender extends RotatingFileAppender {
  void Function(Object line)? printer;

  FileLogAppender({LogRecordFormatter? formatter})
      : super(baseFilePath: '/counter_workshop_logs', formatter: formatter);

  FileLogAppender setupLogging({Level level = Level.ALL, Level stderrLevel = Level.OFF}) {
    Logger.root.clearListeners();
    Logger.root.level = level;

    return fileLogAppender(stderrLevel: stderrLevel)..attachToLogger(Logger.root);
  }

  @override
  void handle(LogRecord record) {
    //log(formatter.format(record));
  }
}

FileLogAppender fileLogAppender({LogRecordFormatter? formatter, Level? stderrLevel}) {
  return FileLogAppender(formatter: formatter);
}
