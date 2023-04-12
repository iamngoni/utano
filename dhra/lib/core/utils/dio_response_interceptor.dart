//
//  dio_response_interceptor
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dio/dio.dart';

import '../models/data/network_response.dart';
import 'encryption.dart';

class DioResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.data is Map<String, dynamic>) {
      // This payload is encrypted and needs to be decrypted
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      // Decrypt the payload
      final Map<String, dynamic>? decrypted =
          decrypt(data['payload'] as String);
      if (decrypted == null) {
        throw Exception('Decryption failed');
      }
      final NetworkResponse networkResponse =
          NetworkResponse.fromJson(decrypted);
      response.data = networkResponse;
    }
    return handler.next(response);
  }
}
