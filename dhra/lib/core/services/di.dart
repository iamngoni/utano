import 'package:get_it/get_it.dart';

import 'abstract/network.dart';
import 'impl/dio_http.dart';
import 'storage.dart';

GetIt di = GetIt.instance;

Future<void> setupServices() async {
  final storageInstance = await StorageService.getInstance();

  di
    ..registerSingleton<StorageService>(storageInstance)
    ..registerFactory<NetworkService>(DioHttpService.new, instanceName: 'http');
}
