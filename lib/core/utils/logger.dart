import 'package:logger/logger.dart';

class Log {
  final _loggerInstance = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  void debug(dynamic message) {
    _loggerInstance.d(message);
  }

  void error(dynamic message) {
    _loggerInstance.e(message);
  }

  void info(dynamic message) {
    _loggerInstance.i(message);
  }
}
