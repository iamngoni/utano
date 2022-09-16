import 'dart:io';

import '../configs/logger.dart';
import '../models/log.dart';
import '../models/log_level.dart';

class AppLogging {
  static AppLogging? _instance;
  static AppLogging getInstance() {
    _instance ??= AppLogging();
    _instance!._start();
    return _instance!;
  }

  final int _maxCacheRows = 1000;
  List<Log> cacheLog = [];
  void Function(Log log)? _writer;

  void _start() {
    log(LogLevel.info, '$runtimeType started');
  }

  void setWriter(void Function(Log log) writer) {
    _writer = writer;
    for (var a in cacheLog) {
      _writer!(a);
    }
  }

  void log(LogLevel logLevel, String message, {String stacktrace = ""}) {
    var loggedLog = Log(
      message: message,
      logLevel: logLevel,
      timestamp: DateTime.now().toUtc().toIso8601String(),
      stacktrace: stacktrace,
    );

    switch (loggedLog.logLevel) {
      case LogLevel.debug:
        logger.debug(loggedLog.message);
        break;
      case LogLevel.info:
        logger.info(loggedLog.message);
        break;
      case LogLevel.warning:
        logger.warning(loggedLog.message);
        break;
      case LogLevel.error:
        logger.error(loggedLog.message);
        break;
      default:
        logger.wtf(loggedLog.message);
        break;
    }

    if (Platform.isAndroid) {
      if (_writer == null) {
        logger.warning("Writer is not available");
        cacheLog.add(loggedLog);
        if (cacheLog.length > _maxCacheRows) {
          cacheLog.removeRange(0, cacheLog.length - _maxCacheRows);
        }
      } else {
        _writer!(loggedLog);
      }
    }
  }
}
