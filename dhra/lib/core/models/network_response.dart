//
//  network_response
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_response.freezed.dart';
part 'network_response.g.dart';

@freezed
class NetworkResponse with _$NetworkResponse {
  factory NetworkResponse({
    required bool status,
    Map<String, dynamic>? data,
    String? message,
  }) = _NetworkResponse;

  factory NetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseFromJson(json);
}
