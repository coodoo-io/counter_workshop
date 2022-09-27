import 'package:counter_workshop/src/core/logger/appenders.dart';
import 'package:counter_workshop/src/core/logger/log_formatters.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

final appLogger = Logger('CounterWorkshop');

class AppLogger {
  // ignore: unused_field
  static late AppLogger _singleton;

  factory AppLogger() => _singleton = AppLogger._initLogger();

  String defineOutputColor(Level level) {
    String outputColor = '';
    switch (level.name) {
      case 'ALL':
      case 'FINEST':
      case 'FINER':
      case 'FINE':
      case 'CONFIG':
        outputColor = '\x1B[37m';
        break;
      case 'INFO':
      case 'WARNING':
        outputColor = '\x1B[33m';
        break;
      case 'SEVERE':
      case 'SHOUT':
        outputColor = '\x1B[31m';
        break;
      default:
        outputColor = '\x1B[37m';
    }
    return outputColor;
  }

  AppLogger._initLogger() {
    //String outputColor = '';

    if (kDebugMode) {
      recordStackTraceAtLevel = Level.WARNING;
      // Logger.root.onRecord.listen((record) {
      //   outputColor = defineOutputColor(record.level);
      //   if (record.error != null && record.stackTrace != null) {
      //     log(
      //       '${outputColor}Level: ${record.level.name} \nLoggerName: ${record.loggerName} \nTime: ${record.time} \nMessage: ${record.message} \nError: ${record.error} \nException: ${record.stackTrace} \x1B[0m',
      //       level: record.level.value,
      //       name: record.loggerName,
      //       time: record.time,
      //       error: record.error,
      //       stackTrace: record.stackTrace,
      //     );
      //   } else if (record.error != null) {
      //     log(
      //       '$outputColor Level: ${record.level.name} \nLoggerName: ${record.loggerName} \nTime: ${record.time} \nMessage: ${record.message} \nError: ${record.error}\x1B[0m',
      //       level: record.level.value,
      //       name: record.loggerName,
      //       time: record.time,
      //       error: record.error,
      //     );
      //   } else {
      //     log(
      //       '$outputColor Level: ${record.level.name} \nLoggerName: ${record.loggerName} \nTime: ${record.time} \nMessage: ${record.message}\x1B[0m',
      //       level: record.level.value,
      //       name: record.loggerName,
      //       time: record.time,
      //     );
      //   }
      // });

      AppDevLogAppender(formatter: const AppDevLogRecordFormatter()).attachToLogger(Logger.root);
    }

    // if (kReleaseMode) {
    //   recordStackTraceAtLevel = Level.WARNING;

    //   //   Logger.root.onRecord.listen((record) {
    //   //     outputColor = defineOutputColor(record.level);
    //   //     if (record.error != null && record.stackTrace != null) {
    //   //       log(
    //   //         'Level: ${record.level.name} \nLoggerName: ${record.loggerName} \nTime: ${record.time} \nMessage: ${record.message} \nError: ${record.error} \nException: ${record.stackTrace}',
    //   //         level: record.level.value,
    //   //         name: record.loggerName,
    //   //         time: record.time,
    //   //         error: record.error,
    //   //         stackTrace: record.stackTrace,
    //   //       );
    //   //     } else if (record.error != null) {
    //   //       log(
    //   //         'Level: ${record.level.name} \nLoggerName: ${record.loggerName} \nTime: ${record.time} \nMessage: ${record.message} \nError: ${record.error}',
    //   //         level: record.level.value,
    //   //         name: record.loggerName,
    //   //         time: record.time,
    //   //         error: record.error,
    //   //       );
    //   //     } else {
    //   //       log(
    //   //         'Level: ${record.level.name} \nLoggerName: ${record.loggerName} \nTime: ${record.time} \nMessage: ${record.message}',
    //   //         level: record.level.value,
    //   //         name: record.loggerName,
    //   //         time: record.time,
    //   //       );
    //   //     }
    //   //   });

    //   // Logging_appender
    //   AppReleaseLogAppender(formatter: const AppReleaseLogRecordFormatter()).attachToLogger(Logger.root);
    // }
  }
}
