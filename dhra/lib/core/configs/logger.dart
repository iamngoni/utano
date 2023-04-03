//
//  logger
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    printTime: true,
  ),
);

extension AppLogger on Logger {
  void verbose(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      v(message, error, stackTrace);
  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      d(message, error, stackTrace);
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      i(message, error, stackTrace);
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      w(message, error, stackTrace);
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      e(message, error, stackTrace);
}
