// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      dateJoined: json['date_joined'] as String,
      createdAt: json['created_at'] as String,
      isActive: json['is_active'] as bool,
      isVerified: json['is_verified'] as bool,
      username: json['username'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      passwordUpdatedAt: json['password_updated_at'] as String,
      receiveEmailNotifications: json['receive_email_notifications'] as bool,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'last_login': instance.lastLogin?.toIso8601String(),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'date_joined': instance.dateJoined,
      'created_at': instance.createdAt,
      'is_active': instance.isActive,
      'is_verified': instance.isVerified,
      'username': instance.username,
      'role': _$UserRoleEnumMap[instance.role]!,
      'password_updated_at': instance.passwordUpdatedAt,
      'receive_email_notifications': instance.receiveEmailNotifications,
    };

const _$UserRoleEnumMap = {
  UserRole.patient: 'PATIENT',
  UserRole.doctor: 'DOCTOR',
  UserRole.systemAdmin: 'SYSTEM_ADMIN',
  UserRole.admin: 'ADMIN',
  UserRole.nurse: 'NURSE',
  UserRole.labTechnician: 'LAB_TECHNICIAN',
  UserRole.pharmacist: 'PHARMACIST',
};
