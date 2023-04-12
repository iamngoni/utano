//
//  employment_status
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'employment_status.freezed.dart';
part 'employment_status.g.dart';

@freezed
class EmploymentStatus with _$EmploymentStatus {
  factory EmploymentStatus({
    required String description,
    required String value,
  }) = _EmploymentStatus;

  factory EmploymentStatus.fromJson(Map<String, dynamic> json) =>
      _$EmploymentStatusFromJson(json);
}
