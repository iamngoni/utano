// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_institution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthInstitution<T> _$HealthInstitutionFromJson<T>(Map<String, dynamic> json) {
  return _HealthInstitution<T>.fromJson(json);
}

/// @nodoc
mixin _$HealthInstitution<T> {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(fromJson: districtFromJson, toJson: districtToJson)
  T get district => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthInstitutionCopyWith<T, HealthInstitution<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthInstitutionCopyWith<T, $Res> {
  factory $HealthInstitutionCopyWith(HealthInstitution<T> value,
          $Res Function(HealthInstitution<T>) then) =
      _$HealthInstitutionCopyWithImpl<T, $Res, HealthInstitution<T>>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      String name,
      String address,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String email,
      String logo,
      @JsonKey(fromJson: districtFromJson, toJson: districtToJson) T district});
}

/// @nodoc
class _$HealthInstitutionCopyWithImpl<T, $Res,
        $Val extends HealthInstitution<T>>
    implements $HealthInstitutionCopyWith<T, $Res> {
  _$HealthInstitutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? name = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? logo = null,
    Object? district = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HealthInstitutionCopyWith<T, $Res>
    implements $HealthInstitutionCopyWith<T, $Res> {
  factory _$$_HealthInstitutionCopyWith(_$_HealthInstitution<T> value,
          $Res Function(_$_HealthInstitution<T>) then) =
      __$$_HealthInstitutionCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      String name,
      String address,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String email,
      String logo,
      @JsonKey(fromJson: districtFromJson, toJson: districtToJson) T district});
}

/// @nodoc
class __$$_HealthInstitutionCopyWithImpl<T, $Res>
    extends _$HealthInstitutionCopyWithImpl<T, $Res, _$_HealthInstitution<T>>
    implements _$$_HealthInstitutionCopyWith<T, $Res> {
  __$$_HealthInstitutionCopyWithImpl(_$_HealthInstitution<T> _value,
      $Res Function(_$_HealthInstitution<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? name = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? logo = null,
    Object? district = freezed,
  }) {
    return _then(_$_HealthInstitution<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthInstitution<T> implements _HealthInstitution<T> {
  _$_HealthInstitution(
      {required this.id,
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @JsonKey(name: 'updated_at')
          required this.updatedAt,
      @JsonKey(name: 'deleted_at')
          required this.deletedAt,
      required this.name,
      required this.address,
      @JsonKey(name: 'phone_number')
          required this.phoneNumber,
      required this.email,
      required this.logo,
      @JsonKey(fromJson: districtFromJson, toJson: districtToJson)
          required this.district});

  factory _$_HealthInstitution.fromJson(Map<String, dynamic> json) =>
      _$$_HealthInstitutionFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String email;
  @override
  final String logo;
  @override
  @JsonKey(fromJson: districtFromJson, toJson: districtToJson)
  final T district;

  @override
  String toString() {
    return 'HealthInstitution<$T>(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, name: $name, address: $address, phoneNumber: $phoneNumber, email: $email, logo: $logo, district: $district)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthInstitution<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            const DeepCollectionEquality().equals(other.district, district));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      deletedAt,
      name,
      address,
      phoneNumber,
      email,
      logo,
      const DeepCollectionEquality().hash(district));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HealthInstitutionCopyWith<T, _$_HealthInstitution<T>> get copyWith =>
      __$$_HealthInstitutionCopyWithImpl<T, _$_HealthInstitution<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthInstitutionToJson<T>(
      this,
    );
  }
}

abstract class _HealthInstitution<T> implements HealthInstitution<T> {
  factory _HealthInstitution(
      {required final String id,
      @JsonKey(name: 'created_at')
          required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
          required final DateTime updatedAt,
      @JsonKey(name: 'deleted_at')
          required final DateTime? deletedAt,
      required final String name,
      required final String address,
      @JsonKey(name: 'phone_number')
          required final String phoneNumber,
      required final String email,
      required final String logo,
      @JsonKey(fromJson: districtFromJson, toJson: districtToJson)
          required final T district}) = _$_HealthInstitution<T>;

  factory _HealthInstitution.fromJson(Map<String, dynamic> json) =
      _$_HealthInstitution<T>.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  String get name;
  @override
  String get address;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  String get email;
  @override
  String get logo;
  @override
  @JsonKey(fromJson: districtFromJson, toJson: districtToJson)
  T get district;
  @override
  @JsonKey(ignore: true)
  _$$_HealthInstitutionCopyWith<T, _$_HealthInstitution<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
