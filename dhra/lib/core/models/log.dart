/*
    @Project: hekima_patient
    @Date: 10, September, 2022
    @Author: Ngonidzashe Mangudya

    Copyright (c) 2022 ModestNerd
*/

import 'log_level.dart';

class Log {
  Log({
    required this.timestamp,
    required this.logLevel,
    required this.message,
    this.stacktrace = '',
  });
  final String timestamp;
  final LogLevel logLevel;
  final String message;
  final String stacktrace;

  @override
  String toString() {
    final List<String> result = [
      '[LOGGING] ${logLevel.toString()} $timestamp Message: $message'
    ];
    if (stacktrace.isNotEmpty) {
      result.add('[LOGGING] StackTrace: $stacktrace');
    }
    return result.join('\n');
  }
}
