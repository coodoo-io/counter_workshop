import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

LogRecordFormatter defaultLogRecordFormatter() => const DefaultLogRecordFormatter();

LogRecordFormatter defaultReleaseLogRecordFormatter() => const DefaultLogRecordFormatter();

class AppDevLogRecordFormatter extends LogRecordFormatter {
  const AppDevLogRecordFormatter();

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

  @override
  StringBuffer formatToStringBuffer(LogRecord rec, StringBuffer sb) {
    String outputColor = defineOutputColor(rec.level);
    sb.write(
      '$outputColor ${rec.time} ${rec.level.name} ${rec.zone} '
      '${rec.loggerName} - ${rec.message}',
    );

    if (rec.error != null) {
      sb.writeln();
      sb.write('### ${rec.error?.runtimeType}: ');
      sb.write(rec.error);
    }
    final stackTrace = rec.stackTrace ?? (rec.error is Error ? (rec.error as Error).stackTrace : null);
    if (stackTrace != null) {
      sb.writeln();
      sb.write(stackTrace);
    }
    sb.write('\x1B[0m');
    return sb;
  }
}

class AppReleaseLogRecordFormatter extends LogRecordFormatter {
  const AppReleaseLogRecordFormatter();

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

  @override
  StringBuffer formatToStringBuffer(LogRecord rec, StringBuffer sb) {
    String outputColor = defineOutputColor(rec.level);
    sb.write(
      '$outputColor${rec.time} ${rec.level.name}  '
      '${rec.loggerName} - ${rec.message}',
    );

    if (rec.error != null) {
      sb.writeln();
      sb.write('### ${rec.error?.runtimeType}: ');
      sb.write(rec.error);
    }
    // ignore: avoid_as
    final stackTrace = rec.stackTrace ??
        // ignore: cast_nullable_to_non_nullable
        (rec.error is Error ? (rec.error as Error).stackTrace : null);
    if (stackTrace != null) {
      sb.writeln();
      sb.write(stackTrace);
    }
    sb.write('\x1B[0m');
    return sb;
  }
}
