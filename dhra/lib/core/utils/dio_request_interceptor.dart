//
//  dio_request_interceptor
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../configs/configs.dart';
import '../models/data/auth_response.dart';
import '../models/data/network_response.dart';
import '../services/di.dart';
import '../services/secure_storage.dart';

class DioRequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      String? accessToken =
          await di<SecureStorageService>().getFromDisk('access_token');
      if (accessToken != null) {
        final bool isTokenExpired = Jwt.isExpired(accessToken);
        logger.info('isTokenExpired: $isTokenExpired');

        if (isTokenExpired) {
          logger.info('Clearing existing token');
          await di<SecureStorageService>().removeFromDisk('access_token');
          logger.info('Fetching new token');
          final dio = di<Dio>();
          final String? refreshToken =
              await di<SecureStorageService>().getFromDisk('refresh_token');
          final Response<NetworkResponse> response = await dio.post(
            '/auth/token/refresh',
            data: {
              'refresh_token': refreshToken,
            },
          );
          final NetworkResponse networkResponse = response.data!;
          final AuthResponse authResponse =
              AuthResponse.fromJson(networkResponse.data!);
          accessToken = authResponse.accessToken;
          await di<SecureStorageService>()
              .saveToDisk('access_token', authResponse.accessToken);
          await di<SecureStorageService>()
              .saveToDisk('refresh_token', authResponse.refreshToken);
        }

        options.headers.addAll({'Authorization': 'Bearer $accessToken'});
      }
    } catch (e, s) {
      logger
        ..error('Probably failed to auth or retrieve auth token')
        ..error(e)
        ..error(s);
    }

    return handler.next(options);
  }
}
