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
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;

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
      String name,
      String address,
      String logo,
      String email,
      @JsonKey(name: 'phone_number') String phoneNumber});
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
    Object? name = null,
    Object? address = null,
    Object? logo = null,
    Object? email = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      String name,
      String address,
      String logo,
      String email,
      @JsonKey(name: 'phone_number') String phoneNumber});
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
    Object? name = null,
    Object? address = null,
    Object? logo = null,
    Object? email = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$_HealthInstitution(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthInstitution extends _HealthInstitution {
  const _$_HealthInstitution(
      {required this.id,
      required this.name,
      required this.address,
      required this.logo,
      required this.email,
      @JsonKey(name: 'phone_number') required this.phoneNumber})
      : super._();

  factory _$_HealthInstitution.fromJson(Map<String, dynamic> json) =>
      _$$_HealthInstitutionFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String logo;
  @override
  final String email;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @override
  String toString() {
    return 'HealthInstitution(id: $id, name: $name, address: $address, logo: $logo, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthInstitution &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, address, logo, email, phoneNumber);

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
  const factory _HealthInstitution(
          {required final String id,
          required final String name,
          required final String address,
          required final String logo,
          required final String email,
          @JsonKey(name: 'phone_number') required final String phoneNumber}) =
      _$_HealthInstitution;
  const _HealthInstitution._() : super._();

  factory _HealthInstitution.fromJson(Map<String, dynamic> json) =
      _$_HealthInstitution.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get logo;
  @override
  String get email;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_HealthInstitutionCopyWith<_$_HealthInstitution> get copyWith =>
      throw _privateConstructorUsedError;
}
