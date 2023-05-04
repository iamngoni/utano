// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_institution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthInstitution _$$_HealthInstitutionFromJson(Map<String, dynamic> json) =>
    _$_HealthInstitution(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      logo: json['logo'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$$_HealthInstitutionToJson(
        _$_HealthInstitution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'logo': instance.logo,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
    };
