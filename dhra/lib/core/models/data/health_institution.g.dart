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
    _$_HealthInstitution instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deleted_at', instance.deletedAt?.toIso8601String());
  val['name'] = instance.name;
  val['address'] = instance.address;
  val['phone_number'] = instance.phoneNumber;
  val['email'] = instance.email;
  val['logo'] = instance.logo;
  val['district'] = instance.district.toJson();
  return val;
}
