//
//  check_in
//  dhra
//
//  Created by Ngonidzashe Mangudya on 12/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dhra/core/models/data/patient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'check_in_status.dart';
import 'health_institution.dart';

part 'check_in.freezed.dart';
part 'check_in.g.dart';

@freezed
class CheckIn with _$CheckIn {
  //             "status": "DISMISSED",
  //             "health_institution": "inst_AV3hQXm9tDBBgI6RUll6L62pY4UW4W"
  const factory CheckIn({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'date_of_birth') required DateTime dateOfBirth,
    required String address,
    @JsonKey(name: 'mobile_number') required String mobileNumber,
    required String gender,
    required CheckInStatus status,
    @JsonKey(name: 'health_institution')
        required HealthInstitution healthInstitution,
    required Patient patient,
    double? temperature,
    @JsonKey(name: 'systolic_blood_pressure') double? systolicBloodPressure,
    @JsonKey(name: 'diastolic_blood_pressure') double? diastolicBloodPressure,
    double? pulse,
    @JsonKey(name: 'respiratory_rate') double? respiratoryRate,
    @JsonKey(name: 'patient_notes') String? patientNotes,
    @JsonKey(name: 'examination_notes') String? examinationNotes,
    @JsonKey(name: 'diagnosis_notes') String? diagnosisNotes,
    @JsonKey(name: 'treatment_notes') String? treatmentNotes,
  }) = _CheckIn;

  const CheckIn._();

  factory CheckIn.fromJson(Map<String, dynamic> json) =>
      _$CheckInFromJson(json);
}
