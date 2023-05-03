// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      isActive: json['is_active'] as bool,
      isVerified: json['is_verified'] as bool,
      username: json['username'] as String,
      role: $enumDecode(_$UserRolesEnumMap, json['role']),
      receiveEmailNotifications: json['receive_email_notifications'],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{
    'first_name': instance.firstName,
    'last_name': instance.lastName,
    'is_active': instance.isActive,
    'is_verified': instance.isVerified,
    'username': instance.username,
    'role': _$UserRolesEnumMap[instance.role]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'receive_email_notifications', instance.receiveEmailNotifications);
  return val;
}

const _$UserRolesEnumMap = {
  UserRoles.patient: 'PATIENT',
  UserRoles.doctor: 'DOCTOR',
  UserRoles.systemAdmin: 'SYSTEM_ADMIN',
  UserRoles.admin: 'ADMIN',
  UserRoles.nurse: 'NURSE',
  UserRoles.healthInstitution: 'HEALTH_INSTITUTION',
  UserRoles.labTechnician: 'LAB_TECHNICIAN',
  UserRoles.pharmacist: 'PHARMACIST',
};
