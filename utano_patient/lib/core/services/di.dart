import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../configs/api.dart';
import '../functions/dio_on_error_interceptor.dart';
import '../functions/dio_request_interceptor.dart';
import '../functions/dio_response_interceptor.dart';
import 'secure_storage.dart';
import 'storage.dart';

GetIt di = GetIt.instance;

Future<void> setupServices() async {
  final storageInstance = await StorageService.getInstance();
  final secureStorageInstance = await SecureStorageService.getInstance();

  di
    ..registerSingleton<StorageService>(storageInstance)
    ..registerSingleton<SecureStorageService>(secureStorageInstance)
    ..registerSingleton<Dio>(
      Dio()
        ..options.baseUrl = ApiConfig.baseUrl
        ..interceptors.add(DioRequestInterceptor())
        ..interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true))
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
          ),
        )
        ..interceptors.add(DioResponseInterceptor())
        ..interceptors.add(DioOnErrorInterceptor()),
    );
}
