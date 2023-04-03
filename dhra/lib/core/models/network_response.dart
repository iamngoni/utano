//
//  network_response
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

class NetworkResponse {
  NetworkResponse({required this.status, this.data, this.message});
  final bool status;
  final Map<String, dynamic>? data;
  final String? message;
}
