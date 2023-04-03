//
//  health_institution
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import 'district.dart';

part 'health_institution.freezed.dart';
part 'health_institution.g.dart';

@freezed
class HealthInstitution<T> with _$HealthInstitution {
  factory HealthInstitution({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') required DateTime? deletedAt,
    required String name,
    required String address,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String email,
    required String logo,
    @JsonKey(fromJson: districtFromJson, toJson: districtToJson)
        required T district,
  }) = _HealthInstitution;

  factory HealthInstitution.fromJson(Map<String, dynamic> json) =>
      _$HealthInstitutionFromJson(json);
}

dynamic districtFromJson(dynamic value) {
  if (value is Map<String, dynamic>) {
    return District.fromJson(value);
  } else {
    return value;
  }
}

dynamic districtToJson(dynamic value) {
  if (value is District) {
    return value.toJson();
  } else {
    return value;
  }
}
