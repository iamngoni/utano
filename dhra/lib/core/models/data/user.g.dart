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
      dateJoined: json['date_joined'] == null
          ? null
          : DateTime.parse(json['date_joined'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isActive: json['is_active'] as bool,
      isVerified: json['is_verified'] as bool,
      username: json['username'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      passwordUpdatedAt: json['password_updated_at'] == null
          ? null
          : DateTime.parse(json['password_updated_at'] as String),
      receiveEmailNotifications: json['receive_email_notifications'] as bool,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_login', instance.lastLogin?.toIso8601String());
  val['first_name'] = instance.firstName;
  val['last_name'] = instance.lastName;
  writeNotNull('date_joined', instance.dateJoined?.toIso8601String());
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  val['is_active'] = instance.isActive;
  val['is_verified'] = instance.isVerified;
  val['username'] = instance.username;
  val['role'] = _$UserRoleEnumMap[instance.role]!;
  writeNotNull(
      'password_updated_at', instance.passwordUpdatedAt?.toIso8601String());
  val['receive_email_notifications'] = instance.receiveEmailNotifications;
  writeNotNull('gender', instance.gender);
  return val;
}

const _$UserRoleEnumMap = {
  UserRole.patient: 'PATIENT',
  UserRole.doctor: 'DOCTOR',
  UserRole.systemAdmin: 'SYSTEM_ADMIN',
  UserRole.admin: 'ADMIN',
  UserRole.nurse: 'NURSE',
  UserRole.labTechnician: 'LAB_TECHNICIAN',
  UserRole.pharmacist: 'PHARMACIST',
};
