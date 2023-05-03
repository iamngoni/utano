import 'dart:core';

class ApiConfig {
  static const String _api = 'http://127.0.0.1:8000/api';
  static const _apiVersion = '1.0';
  static const baseUrl = '$_api/$_apiVersion';
  static String baseEndpoint = _api.replaceAll('/api', '');
  static const String dyteApi = 'aceb1b31e0d826fb03a9';
  static const String dyteOrganization = '60fb0654-1322-46d5-8a7e-22de69c492c3';
}
