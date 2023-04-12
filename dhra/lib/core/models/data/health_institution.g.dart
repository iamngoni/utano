// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_institution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthInstitution _$$_HealthInstitutionFromJson(Map<String, dynamic> json) =>
    _$_HealthInstitution(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      logo: json['logo'] as String,
      district: District.fromJson(json['district'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HealthInstitutionToJson(
        _$_HealthInstitution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'name': instance.name,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'logo': instance.logo,
      'district': instance.district,
    };
