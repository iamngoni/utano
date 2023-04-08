//
//  dio_on_error_interceptor
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dio/dio.dart';

import '../models/data/auth_response.dart';
import '../models/data/network_response.dart';
import '../services/di.dart';
import '../services/secure_storage.dart';

class DioOnErrorInterceptor extends Interceptor {
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        !err.requestOptions.uri.path.contains('/signin')) {
      final String? refreshToken =
          await di<SecureStorageService>().getFromDisk('refresh_token');
      if (refreshToken != null) {
        final dio = di<Dio>();
        final Response<NetworkResponse> response = await dio.post(
          '/auth/token/refresh',
          data: {
            'refresh_token': refreshToken,
          },
        );
        final NetworkResponse networkResponse = response.data!;
        final AuthResponse authResponse =
            AuthResponse.fromJson(networkResponse.data!);
        await di<SecureStorageService>()
            .saveToDisk('access_token', authResponse.accessToken);
        await di<SecureStorageService>()
            .saveToDisk('refresh_token', authResponse.refreshToken);

        // process initial request
        final RequestOptions requestOptions = err.requestOptions;
        final opts = Options(method: requestOptions.method);
        final Response<NetworkResponse> response2 = await dio.request(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: opts,
          cancelToken: requestOptions.cancelToken,
          onReceiveProgress: requestOptions.onReceiveProgress,
        );

        if (response2 != null) {
          return handler.resolve(response2);
        } else {
          return handler.next(err);
        }
      } else {
        return handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }
}
