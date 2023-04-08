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
class HealthInstitution with _$HealthInstitution {
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
    required District district,
  }) = _HealthInstitution;

  const HealthInstitution._();

  factory HealthInstitution.fromJson(Map<String, dynamic> json) =>
      _$HealthInstitutionFromJson(json);

  @override
  String toString() => name;
}
