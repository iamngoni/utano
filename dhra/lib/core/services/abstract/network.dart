/*
    @Project: hekima_patient
    @Date: 10, September, 2022
    @Author: Ngonidzashe Mangudya
 
    Copyright (c) 2022 ModestNerd
*/
import '../../models/network_response.dart';

abstract class NetworkService {
  /// Get
  ///
  /// Retrieve objects from a network
  Future<NetworkResponse> get(
    String url, {
    Map<String, dynamic>? headers,
  });

  /// Post
  ///
  /// Send data objects to a network
  Future<NetworkResponse> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  });

  /// Put
  ///
  /// Update object resources on a network
  Future<NetworkResponse> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  });

  /// Delete
  ///
  /// Remove data objects from a network
  Future<NetworkResponse> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  });
}
