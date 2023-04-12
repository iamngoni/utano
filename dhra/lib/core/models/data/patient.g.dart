// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$$_PatientFromJson(Map<String, dynamic> json) => _$_Patient(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      medicalRecordNumber: json['medical_record_number'] as String,
      placeOfBirth: json['place_of_birth'] as String,
      address: json['address'] as String,
      bloodType: json['blood_type'] as String,
      fitzpatrickSkinType: json['fitzpatrick_skin_type'] as String,
      wheelchair: json['wheelchair'] as bool,
      fatherName: json['father_name'] as String,
      motherName: json['mother_name'] as String,
      occupation: json['occupation'] as String,
      registeredAt: HealthInstitution.fromJson(
          json['registered_at'] as Map<String, dynamic>),
      registeredOn: DateTime.parse(json['registered_on'] as String),
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      mobileNumber: json['mobile_number'] as String?,
      maritalStatus: json['marital_status'] == null
          ? null
          : MaritalStatus.fromJson(
              json['marital_status'] as Map<String, dynamic>),
      employmentStatus: json['employment_status'] == null
          ? null
          : EmploymentStatus.fromJson(
              json['employment_status'] as Map<String, dynamic>),
      nationalIdNumber: json['national_id_number'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
    );

Map<String, dynamic> _$$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'user': instance.user,
      'medical_record_number': instance.medicalRecordNumber,
      'place_of_birth': instance.placeOfBirth,
      'address': instance.address,
      'blood_type': instance.bloodType,
      'fitzpatrick_skin_type': instance.fitzpatrickSkinType,
      'wheelchair': instance.wheelchair,
      'father_name': instance.fatherName,
      'mother_name': instance.motherName,
      'occupation': instance.occupation,
      'registered_at': instance.registeredAt,
      'registered_on': instance.registeredOn.toIso8601String(),
      'height': instance.height,
      'weight': instance.weight,
      'mobile_number': instance.mobileNumber,
      'marital_status': instance.maritalStatus,
      'employment_status': instance.employmentStatus,
      'national_id_number': instance.nationalIdNumber,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
    };
