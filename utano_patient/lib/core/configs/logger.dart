import 'dart:developer';

final Logger logger = Logger();

class Logger {
  void info(
    String message, {
    String? source,
  }) {
    log('============================== INFO ==============================');
    log(
      message,
      name: source ?? '',
      time: DateTime.now(),
    );
    log('==================================================================');
  }

  void warning(
    String message, {
    String? source,
  }) {
    log('============================== WARNING ==============================');
    log(
      message,
      name: source ?? '',
      time: DateTime.now(),
      level: 1000,
    );
    log('=====================================================================');
  }

  void error(
    String message, {
    dynamic error,
    String? source,
    StackTrace? stackTrace,
  }) {
    log('============================== ERROR ==============================');
    log(
      message,
      error: error,
      stackTrace: stackTrace,
      name: source ?? '',
      time: DateTime.now(),
      level: 2000,
    );
    log('===================================================================');
  }
}
