import 'package:get_it/get_it.dart';

import '../utils/logs_file_writer.dart';
import 'abstract/network.dart';
import 'dialog.dart';
import 'dio_http.dart';
import 'logs.dart';
import 'storage.dart';

GetIt di = GetIt.instance;

Future<void> setupServices() async {
  final storageInstance = await StorageService.getInstance();
  final loggingInstance = AppLogging.getInstance();

  di
    ..registerSingleton<StorageService>(storageInstance)
    ..registerSingleton<DialogService>(DialogService())
    ..registerSingleton<AppLogging>(loggingInstance)
    ..registerFactory<NetworkService>(DioHttpService.new, instanceName: 'http');
  await LogsFileWriter().init();
}
