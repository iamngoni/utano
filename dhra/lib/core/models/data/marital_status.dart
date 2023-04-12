//
//  marital_status
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'marital_status.freezed.dart';
part 'marital_status.g.dart';

@freezed
class MaritalStatus with _$MaritalStatus {
  factory MaritalStatus({
    required String description,
    required String value,
  }) = _MaritalStatus;

  factory MaritalStatus.fromJson(Map<String, dynamic> json) =>
      _$MaritalStatusFromJson(json);
}
