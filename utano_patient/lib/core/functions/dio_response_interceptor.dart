//
//  dio_response_interceptor.dart
//  patient
//
//  Created by Ngonidzashe Mangudya on 18/2/2023.
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
