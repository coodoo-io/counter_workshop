import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

class CustomLogFormatter extends LogRecordFormatter {
  const CustomLogFormatter({this.colorsEnabled = false});
  final bool colorsEnabled;

  @override
  StringBuffer formatToStringBuffer(LogRecord rec, StringBuffer sb) {
    String outputColor = defineOutputColor(rec.level, colorsEnabled);
    sb.write(
      '$outputColor${rec.time} ${rec.level.name} [${rec.loggerName}] ${rec.message}',
    );

    if (rec.error != null) {
      sb.write(', $outputColor${rec.error}');
      final stackTrace = rec.stackTrace ?? (rec.error is Error ? (rec.error as Error).stackTrace : null);
      if (stackTrace != null) {
        sb.writeln();
        sb.write('$outputColor$stackTrace');
      }
    }
    return sb;
  }

  String defineOutputColor(Level level, bool colorsEnabled) {
    if (colorsEnabled == false) return '';
    String outputColor = '';
    switch (level.name) {
      case 'WARNING':
        // Warning color
        outputColor = '\x1B[33m';
        break;
      case 'SEVERE':
      case 'SHOUT':
        // ERROR color
        outputColor = '\x1B[31m';
        break;
      default:
        // Standard color
        outputColor = '\x1B[34m';
    }
    return outputColor;
  }
}
