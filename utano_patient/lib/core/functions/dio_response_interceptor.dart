//
//  dio_response_interceptor.dart
//  patient
//
//  Created by Ngonidzashe Mangudya on 18/2/2023.
//

import 'package:dio/dio.dart';

import '../models/data/network_response.dart';

class DioResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.data is Map<String, dynamic>) {
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      final NetworkResponse networkResponse = NetworkResponse.fromJson(data);
      response.data = networkResponse;
    }
    return handler.next(response);
  }
}
