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
  // "id": "p-in_lQbtU3qCvWxjMl0O6sjJbSTEMRnFWE",
  //             "created_at": "2023-03-08T01:11:14.085653+02:00",
  //             "updated_at": "2023-03-08T01:12:23.373394+02:00",
  //             "deleted_at": null,
  //             "first_name": "Ngonidzashe",
  //             "last_name": "Mangudya",
  //             "date_of_birth": "1999-03-07",
  //             "address": "136 Blakeway Drive, Belvedere",
  //             "mobile_number": "+263777213388",
  //             "gender": "MALE",
  //             "temperature": 37.2,
  //             "systolic_blood_pressure": 120,
  //             "diastolic_blood_pressure": 80,
  //             "pulse": 120,
  //             "respiratory_rate": null,
  //             "patient_notes": "Heavy migraines on the right side of the head",
  //             "examination_notes": "Patient looks exhausted",
  //             "diagnosis_notes": "Patient needs rest and to drink lots of water",
  //             "treatment_notes": "Pain meds can be taken to reduce the pain",
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
