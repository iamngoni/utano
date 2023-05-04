//
//  health_institution
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 4/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_institution.freezed.dart';
part 'health_institution.g.dart';

@freezed
class HealthInstitution with _$HealthInstitution {
  // id, name, address, logo, email, phone_number
  const factory HealthInstitution({
    required String id,
    required String name,
    required String address,
    required String logo,
    required String email,
    @JsonKey(name: 'phone_number') required String phoneNumber,
  }) = _HealthInstitution;

  const HealthInstitution._();

  factory HealthInstitution.fromJson(Map<String, dynamic> json) =>
      _$HealthInstitutionFromJson(json);
}
