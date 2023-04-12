//
//  patient
//  dhra
//
//  Created by Ngonidzashe Mangudya on 12/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dhra/core/models/data/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'employment_status.dart';
import 'health_institution.dart';
import 'marital_status.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    required User user,
    @JsonKey(name: 'medical_record_number') required String medicalRecordNumber,
    @JsonKey(name: 'place_of_birth') required String placeOfBirth,
    required String address,
    @JsonKey(name: 'blood_type') required String bloodType,
    @JsonKey(name: 'fitzpatrick_skin_type') required String fitzpatrickSkinType,
    required bool wheelchair,
    @JsonKey(name: 'father_name') required String fatherName,
    @JsonKey(name: 'mother_name') required String motherName,
    required String occupation,
    @JsonKey(name: 'registered_at') required HealthInstitution registeredAt,
    @JsonKey(name: 'registered_on') required DateTime registeredOn,
    double? height,
    double? weight,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    @JsonKey(name: 'marital_status') MaritalStatus? maritalStatus,
    @JsonKey(name: 'employment_status') EmploymentStatus? employmentStatus,
    @JsonKey(name: 'national_id_number') String? nationalIdNumber,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
