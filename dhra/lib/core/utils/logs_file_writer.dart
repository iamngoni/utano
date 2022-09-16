/*
    @Project: hekima_patient
    @Date: 10, September, 2022
    @Author: Ngonidzashe Mangudya

    Copyright (c) 2022 ModestNerd
*/

import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../configs/logger.dart' as app;
import '../models/log.dart';
import '../models/log_level.dart';
import '../services/di.dart';
import '../services/logs.dart';

const String externalLogFilename = "app_log.md";
const String externalBackupLogFilename = "app_backup_log.md";

class LogsFileWriter {
  final AppLogging logger = di<AppLogging>();
  late File _logFile;
  late String _logFilename;
  late File _backupLogFile;
  late String _backupLogFilename;

  Future<void> init() async {
    if (Platform.isAndroid) {
      final Directory? directory = await getExternalStorageDirectory();
      logger.log(LogLevel.info, "External path reported ${directory!.path}");
      _logFilename = join(directory.path, externalLogFilename);
      _logFile = File(_logFilename);
      _backupLogFilename = join(directory.path, externalBackupLogFilename);
      _backupLogFile = File(_backupLogFilename);
      connectLogWriter();
    }
  }

  void connectLogWriter() {
    logger.setWriter(_writer);
  }

  void _writer(Log logging) {
    try {
      if (_logFile.existsSync() && _logFile.lengthSync() > 1000000) {
        if (_backupLogFile.existsSync()) {
          _backupLogFile.deleteSync();
        }
        _backupLogFile = _logFile.renameSync(_backupLogFilename);
        _logFile = File(_logFilename);
      }
      _logFile.writeAsStringSync(
        '${DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now())} ${logging.message}\r\n',
        mode: FileMode.append,
        flush: true,
      );
    } catch (e) {
      app.logger.error("Error while writing to file", e);
    }
  }
}
