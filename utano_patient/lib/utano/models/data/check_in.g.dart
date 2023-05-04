// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckIn _$$_CheckInFromJson(Map<String, dynamic> json) => _$_CheckIn(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      address: json['address'] as String,
      mobileNumber: json['mobile_number'] as String,
      gender: json['gender'] as String,
      temperature: (json['temperature'] as num?)?.toDouble(),
      systolicBloodPressure:
          (json['systolic_blood_pressure'] as num?)?.toDouble(),
      diastolicBloodPressure:
          (json['diastolic_blood_pressure'] as num?)?.toDouble(),
      pulse: (json['pulse'] as num?)?.toDouble(),
      respiratoryRate: (json['respiratory_rate'] as num?)?.toDouble(),
      patientNotes: json['patient_notes'] as String?,
      examinationNotes: json['examination_notes'] as String?,
      diagnosisNotes: json['diagnosis_notes'] as String?,
      treatmentNotes: json['treatment_notes'] as String?,
    );

Map<String, dynamic> _$$_CheckInToJson(_$_CheckIn instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt.toIso8601String(),
    'first_name': instance.firstName,
    'last_name': instance.lastName,
    'date_of_birth': instance.dateOfBirth.toIso8601String(),
    'address': instance.address,
    'mobile_number': instance.mobileNumber,
    'gender': instance.gender,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('temperature', instance.temperature);
  writeNotNull('systolic_blood_pressure', instance.systolicBloodPressure);
  writeNotNull('diastolic_blood_pressure', instance.diastolicBloodPressure);
  writeNotNull('pulse', instance.pulse);
  writeNotNull('respiratory_rate', instance.respiratoryRate);
  writeNotNull('patient_notes', instance.patientNotes);
  writeNotNull('examination_notes', instance.examinationNotes);
  writeNotNull('diagnosis_notes', instance.diagnosisNotes);
  writeNotNull('treatment_notes', instance.treatmentNotes);
  return val;
}
