// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login')
  DateTime? get lastLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_superuser')
  bool get isSuperuser => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_staff')
  bool get isStaff => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_joined')
  String get dateJoined => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool get isVerified => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_updated_at')
  String get passwordUpdatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'receive_email_notifications')
  bool get receiveEmailNotifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'last_login')
          DateTime? lastLogin,
      @JsonKey(name: 'is_superuser')
          bool isSuperuser,
      @JsonKey(name: 'first_name')
          String firstName,
      @JsonKey(name: 'last_name')
          String lastName,
      @JsonKey(name: 'is_staff')
          bool isStaff,
      @JsonKey(name: 'date_joined')
          String dateJoined,
      @JsonKey(name: 'created_at')
          String createdAt,
      @JsonKey(name: 'updated_at')
          String updatedAt,
      @JsonKey(name: 'is_active')
          bool isActive,
      @JsonKey(name: 'is_verified')
          bool isVerified,
      String username,
      UserRole role,
      @JsonKey(name: 'password_updated_at')
          String passwordUpdatedAt,
      @JsonKey(name: 'receive_email_notifications')
          bool receiveEmailNotifications});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastLogin = freezed,
    Object? isSuperuser = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? isStaff = null,
    Object? dateJoined = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
    Object? isVerified = null,
    Object? username = null,
    Object? role = null,
    Object? passwordUpdatedAt = null,
    Object? receiveEmailNotifications = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSuperuser: null == isSuperuser
          ? _value.isSuperuser
          : isSuperuser // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      isStaff: null == isStaff
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool,
      dateJoined: null == dateJoined
          ? _value.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      passwordUpdatedAt: null == passwordUpdatedAt
          ? _value.passwordUpdatedAt
          : passwordUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      receiveEmailNotifications: null == receiveEmailNotifications
          ? _value.receiveEmailNotifications
          : receiveEmailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'last_login')
          DateTime? lastLogin,
      @JsonKey(name: 'is_superuser')
          bool isSuperuser,
      @JsonKey(name: 'first_name')
          String firstName,
      @JsonKey(name: 'last_name')
          String lastName,
      @JsonKey(name: 'is_staff')
          bool isStaff,
      @JsonKey(name: 'date_joined')
          String dateJoined,
      @JsonKey(name: 'created_at')
          String createdAt,
      @JsonKey(name: 'updated_at')
          String updatedAt,
      @JsonKey(name: 'is_active')
          bool isActive,
      @JsonKey(name: 'is_verified')
          bool isVerified,
      String username,
      UserRole role,
      @JsonKey(name: 'password_updated_at')
          String passwordUpdatedAt,
      @JsonKey(name: 'receive_email_notifications')
          bool receiveEmailNotifications});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastLogin = freezed,
    Object? isSuperuser = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? isStaff = null,
    Object? dateJoined = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
    Object? isVerified = null,
    Object? username = null,
    Object? role = null,
    Object? passwordUpdatedAt = null,
    Object? receiveEmailNotifications = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSuperuser: null == isSuperuser
          ? _value.isSuperuser
          : isSuperuser // ignore: cast_nullable_to_non_nullable
              as bool,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      isStaff: null == isStaff
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool,
      dateJoined: null == dateJoined
          ? _value.dateJoined
          : dateJoined // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      passwordUpdatedAt: null == passwordUpdatedAt
          ? _value.passwordUpdatedAt
          : passwordUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      receiveEmailNotifications: null == receiveEmailNotifications
          ? _value.receiveEmailNotifications
          : receiveEmailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {required this.id,
      @JsonKey(name: 'last_login')
          required this.lastLogin,
      @JsonKey(name: 'is_superuser')
          required this.isSuperuser,
      @JsonKey(name: 'first_name')
          required this.firstName,
      @JsonKey(name: 'last_name')
          required this.lastName,
      @JsonKey(name: 'is_staff')
          required this.isStaff,
      @JsonKey(name: 'date_joined')
          required this.dateJoined,
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @JsonKey(name: 'updated_at')
          required this.updatedAt,
      @JsonKey(name: 'is_active')
          required this.isActive,
      @JsonKey(name: 'is_verified')
          required this.isVerified,
      required this.username,
      required this.role,
      @JsonKey(name: 'password_updated_at')
          required this.passwordUpdatedAt,
      @JsonKey(name: 'receive_email_notifications')
          required this.receiveEmailNotifications});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'last_login')
  final DateTime? lastLogin;
  @override
  @JsonKey(name: 'is_superuser')
  final bool isSuperuser;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'is_staff')
  final bool isStaff;
  @override
  @JsonKey(name: 'date_joined')
  final String dateJoined;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @override
  final String username;
  @override
  final UserRole role;
  @override
  @JsonKey(name: 'password_updated_at')
  final String passwordUpdatedAt;
  @override
  @JsonKey(name: 'receive_email_notifications')
  final bool receiveEmailNotifications;

  @override
  String toString() {
    return 'User(id: $id, lastLogin: $lastLogin, isSuperuser: $isSuperuser, firstName: $firstName, lastName: $lastName, isStaff: $isStaff, dateJoined: $dateJoined, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, isVerified: $isVerified, username: $username, role: $role, passwordUpdatedAt: $passwordUpdatedAt, receiveEmailNotifications: $receiveEmailNotifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.isSuperuser, isSuperuser) ||
                other.isSuperuser == isSuperuser) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.isStaff, isStaff) || other.isStaff == isStaff) &&
            (identical(other.dateJoined, dateJoined) ||
                other.dateJoined == dateJoined) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.passwordUpdatedAt, passwordUpdatedAt) ||
                other.passwordUpdatedAt == passwordUpdatedAt) &&
            (identical(other.receiveEmailNotifications,
                    receiveEmailNotifications) ||
                other.receiveEmailNotifications == receiveEmailNotifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lastLogin,
      isSuperuser,
      firstName,
      lastName,
      isStaff,
      dateJoined,
      createdAt,
      updatedAt,
      isActive,
      isVerified,
      username,
      role,
      passwordUpdatedAt,
      receiveEmailNotifications);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {required final String id,
      @JsonKey(name: 'last_login')
          required final DateTime? lastLogin,
      @JsonKey(name: 'is_superuser')
          required final bool isSuperuser,
      @JsonKey(name: 'first_name')
          required final String firstName,
      @JsonKey(name: 'last_name')
          required final String lastName,
      @JsonKey(name: 'is_staff')
          required final bool isStaff,
      @JsonKey(name: 'date_joined')
          required final String dateJoined,
      @JsonKey(name: 'created_at')
          required final String createdAt,
      @JsonKey(name: 'updated_at')
          required final String updatedAt,
      @JsonKey(name: 'is_active')
          required final bool isActive,
      @JsonKey(name: 'is_verified')
          required final bool isVerified,
      required final String username,
      required final UserRole role,
      @JsonKey(name: 'password_updated_at')
          required final String passwordUpdatedAt,
      @JsonKey(name: 'receive_email_notifications')
          required final bool receiveEmailNotifications}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'last_login')
  DateTime? get lastLogin;
  @override
  @JsonKey(name: 'is_superuser')
  bool get isSuperuser;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'is_staff')
  bool get isStaff;
  @override
  @JsonKey(name: 'date_joined')
  String get dateJoined;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_verified')
  bool get isVerified;
  @override
  String get username;
  @override
  UserRole get role;
  @override
  @JsonKey(name: 'password_updated_at')
  String get passwordUpdatedAt;
  @override
  @JsonKey(name: 'receive_email_notifications')
  bool get receiveEmailNotifications;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
