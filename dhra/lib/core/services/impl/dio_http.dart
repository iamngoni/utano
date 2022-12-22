/*
    @Project: hekima_patient
    @Date: 10, September, 2022
    @Author: Ngonidzashe Mangudya
 
    Copyright (c) 2022 ModestNerd
*/
import 'package:dio/dio.dart';

import '../../models/network_response.dart';
import '../abstract/network.dart';

class DioHttpService implements NetworkService {
  final Dio _dio = Dio()
    ..interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

  @override
  Future<NetworkResponse> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse> get(
    String url, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get(
        url,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        return NetworkResponse(
          status: true,
          data: response.data as Map<String, dynamic>,
        );
      } else {
        throw Exception("Failed to fetch");
      }
    } catch (e) {
      return NetworkResponse(status: false, message: e.toString());
    }
  }

  @override
  Future<NetworkResponse> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post(
        url,
        options: Options(
          headers: headers,
        ),
        data: data,
      );
      if ([200, 201].contains(response.statusCode)) {
        return NetworkResponse(
          status: true,
          data: response.data as Map<String, dynamic>,
        );
      } else {
        throw Exception("Failed to fetch");
      }
    } catch (e) {
      if (e is DioError) {
        switch (e.response?.statusCode) {
          case 400:
            final Map<String, dynamic>? issues =
                e.response?.data?['issues'] as Map<String, dynamic>?;
            if (issues != null) {
              final String? issue =
                  (issues[issues.keys.first] as List).first as String?;
              return NetworkResponse(
                status: false,
                message: "$issue",
              );
            }
            return NetworkResponse(
              status: false,
              message: "Check fields",
            );
          case 401:
            final String? message = e.response?.data?['message'] as String?;
            if (message != null) {
              return NetworkResponse(
                status: false,
                message: message,
              );
            }
            return NetworkResponse(
              status: false,
              message: "Check fields",
            );
        }
      }
      return NetworkResponse(status: false, message: e.toString());
    }
  }

  @override
  Future<NetworkResponse> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return NetworkResponse(status: false, message: e.toString());
    }
  }
}
