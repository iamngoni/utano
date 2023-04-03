//
//  dio_response_interceptor
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dio/dio.dart';

import '../models/network_response.dart';

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
