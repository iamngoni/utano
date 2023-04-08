// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee _$$_EmployeeFromJson(Map<String, dynamic> json) => _$_Employee(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      qualifications: (json['qualifications'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      registeredOn: DateTime.parse(json['registered_on'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      registeredAt: HealthInstitution.fromJson(
          json['registered_at'] as Map<String, dynamic>),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      professionalTitle: json['professional_title'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$_EmployeeToJson(_$_Employee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'tags': instance.tags,
      'qualifications': instance.qualifications,
      'registered_on': instance.registeredOn.toIso8601String(),
      'user': instance.user,
      'registered_at': instance.registeredAt,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'professional_title': instance.professionalTitle,
      'bio': instance.bio,
    };
