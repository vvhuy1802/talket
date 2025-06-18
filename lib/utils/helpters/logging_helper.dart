

import 'package:logger/logger.dart';

class LoggingHelper {
  final Logger logIt = Logger(
    level: Level.info,
    printer: PrettyPrinter(
        methodCount: 2,
        // Number of method calls to be displayed
        errorMethodCount: 8,
        // Number of method calls if stacktrace is provided
        lineLength: 200,
        // Width of the output
        colors: true,
        // Colo
        printEmojis: true,
        // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  /// Log a message at level [Level.info].
  void info(
    dynamic message, {
    dynamic error,
    bool showInProd = false,
    StackTrace? stackTrace,
  }) {
    logIt.i(message, error: error, stackTrace: stackTrace);
  }
}
