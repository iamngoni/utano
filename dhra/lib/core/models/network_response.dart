/*
    @Project: dhra
    @Date: 16, September, 2022
    @Author: Ngonidzashe Mangudya
 
    Copyright (c) 2022 ModestNerd
*/
class NetworkResponse {
  NetworkResponse({required this.status, this.data, this.message});
  final bool status;
  final Map<String, dynamic>? data;
  final String? message;
}
