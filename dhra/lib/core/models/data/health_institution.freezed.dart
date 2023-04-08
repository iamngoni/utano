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

HealthInstitution _$HealthInstitutionFromJson(Map<String, dynamic> json) {
  return _HealthInstitution.fromJson(json);
}

/// @nodoc
mixin _$HealthInstitution {
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
  District get district => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthInstitutionCopyWith<HealthInstitution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthInstitutionCopyWith<$Res> {
  factory $HealthInstitutionCopyWith(
          HealthInstitution value, $Res Function(HealthInstitution) then) =
      _$HealthInstitutionCopyWithImpl<$Res, HealthInstitution>;
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
      District district});

  $DistrictCopyWith<$Res> get district;
}

/// @nodoc
class _$HealthInstitutionCopyWithImpl<$Res, $Val extends HealthInstitution>
    implements $HealthInstitutionCopyWith<$Res> {
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
    Object? district = null,
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
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res> get district {
    return $DistrictCopyWith<$Res>(_value.district, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HealthInstitutionCopyWith<$Res>
    implements $HealthInstitutionCopyWith<$Res> {
  factory _$$_HealthInstitutionCopyWith(_$_HealthInstitution value,
          $Res Function(_$_HealthInstitution) then) =
      __$$_HealthInstitutionCopyWithImpl<$Res>;
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
      District district});

  @override
  $DistrictCopyWith<$Res> get district;
}

/// @nodoc
class __$$_HealthInstitutionCopyWithImpl<$Res>
    extends _$HealthInstitutionCopyWithImpl<$Res, _$_HealthInstitution>
    implements _$$_HealthInstitutionCopyWith<$Res> {
  __$$_HealthInstitutionCopyWithImpl(
      _$_HealthInstitution _value, $Res Function(_$_HealthInstitution) _then)
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
    Object? district = null,
  }) {
    return _then(_$_HealthInstitution(
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
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthInstitution extends _HealthInstitution {
  _$_HealthInstitution(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'deleted_at') required this.deletedAt,
      required this.name,
      required this.address,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      required this.email,
      required this.logo,
      required this.district})
      : super._();

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
  final District district;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthInstitution &&
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
            (identical(other.district, district) ||
                other.district == district));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt,
      deletedAt, name, address, phoneNumber, email, logo, district);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HealthInstitutionCopyWith<_$_HealthInstitution> get copyWith =>
      __$$_HealthInstitutionCopyWithImpl<_$_HealthInstitution>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthInstitutionToJson(
      this,
    );
  }
}

abstract class _HealthInstitution extends HealthInstitution {
  factory _HealthInstitution(
      {required final String id,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'deleted_at') required final DateTime? deletedAt,
      required final String name,
      required final String address,
      @JsonKey(name: 'phone_number') required final String phoneNumber,
      required final String email,
      required final String logo,
      required final District district}) = _$_HealthInstitution;
  _HealthInstitution._() : super._();

  factory _HealthInstitution.fromJson(Map<String, dynamic> json) =
      _$_HealthInstitution.fromJson;

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
  District get district;
  @override
  @JsonKey(ignore: true)
  _$$_HealthInstitutionCopyWith<_$_HealthInstitution> get copyWith =>
      throw _privateConstructorUsedError;
}
