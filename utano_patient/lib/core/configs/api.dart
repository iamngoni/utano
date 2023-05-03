import 'dart:core';

class ApiConfig {
  // static const String _api = 'https://hekima.modestnerd.co/api';
  static const String _api = 'http://143.244.160.76:8001/api';
  static const _apiVersion = '1.0';
  static const baseUrl = '$_api/$_apiVersion';
  // static const String webSocketUrl = 'wss://hekima.modestnerd.co/api/1.0/chat';
  static const String webSocketUrl = 'ws://143.244.160.76:8001/api/1.0/chat';
  static String baseEndpoint = _api.replaceAll('/api', '');
  static const String dyteApi = 'aceb1b31e0d826fb03a9';
  static const String dyteOrganization = '60fb0654-1322-46d5-8a7e-22de69c492c3';
}
