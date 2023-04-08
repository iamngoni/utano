// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SystemStats _$SystemStatsFromJson(Map<String, dynamic> json) {
  return _SystemStats.fromJson(json);
}

/// @nodoc
mixin _$SystemStats {
  @JsonKey(name: 'health_institutions')
  int get healthInstitutions => throw _privateConstructorUsedError;
  int get employees => throw _privateConstructorUsedError;
  int get patients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SystemStatsCopyWith<SystemStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemStatsCopyWith<$Res> {
  factory $SystemStatsCopyWith(
          SystemStats value, $Res Function(SystemStats) then) =
      _$SystemStatsCopyWithImpl<$Res, SystemStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'health_institutions') int healthInstitutions,
      int employees,
      int patients});
}

/// @nodoc
class _$SystemStatsCopyWithImpl<$Res, $Val extends SystemStats>
    implements $SystemStatsCopyWith<$Res> {
  _$SystemStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healthInstitutions = null,
    Object? employees = null,
    Object? patients = null,
  }) {
    return _then(_value.copyWith(
      healthInstitutions: null == healthInstitutions
          ? _value.healthInstitutions
          : healthInstitutions // ignore: cast_nullable_to_non_nullable
              as int,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      patients: null == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SystemStatsCopyWith<$Res>
    implements $SystemStatsCopyWith<$Res> {
  factory _$$_SystemStatsCopyWith(
          _$_SystemStats value, $Res Function(_$_SystemStats) then) =
      __$$_SystemStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'health_institutions') int healthInstitutions,
      int employees,
      int patients});
}

/// @nodoc
class __$$_SystemStatsCopyWithImpl<$Res>
    extends _$SystemStatsCopyWithImpl<$Res, _$_SystemStats>
    implements _$$_SystemStatsCopyWith<$Res> {
  __$$_SystemStatsCopyWithImpl(
      _$_SystemStats _value, $Res Function(_$_SystemStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healthInstitutions = null,
    Object? employees = null,
    Object? patients = null,
  }) {
    return _then(_$_SystemStats(
      healthInstitutions: null == healthInstitutions
          ? _value.healthInstitutions
          : healthInstitutions // ignore: cast_nullable_to_non_nullable
              as int,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      patients: null == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SystemStats implements _SystemStats {
  _$_SystemStats(
      {@JsonKey(name: 'health_institutions') required this.healthInstitutions,
      required this.employees,
      required this.patients});

  factory _$_SystemStats.fromJson(Map<String, dynamic> json) =>
      _$$_SystemStatsFromJson(json);

  @override
  @JsonKey(name: 'health_institutions')
  final int healthInstitutions;
  @override
  final int employees;
  @override
  final int patients;

  @override
  String toString() {
    return 'SystemStats(healthInstitutions: $healthInstitutions, employees: $employees, patients: $patients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SystemStats &&
            (identical(other.healthInstitutions, healthInstitutions) ||
                other.healthInstitutions == healthInstitutions) &&
            (identical(other.employees, employees) ||
                other.employees == employees) &&
            (identical(other.patients, patients) ||
                other.patients == patients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, healthInstitutions, employees, patients);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SystemStatsCopyWith<_$_SystemStats> get copyWith =>
      __$$_SystemStatsCopyWithImpl<_$_SystemStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SystemStatsToJson(
      this,
    );
  }
}

abstract class _SystemStats implements SystemStats {
  factory _SystemStats(
      {@JsonKey(name: 'health_institutions')
          required final int healthInstitutions,
      required final int employees,
      required final int patients}) = _$_SystemStats;

  factory _SystemStats.fromJson(Map<String, dynamic> json) =
      _$_SystemStats.fromJson;

  @override
  @JsonKey(name: 'health_institutions')
  int get healthInstitutions;
  @override
  int get employees;
  @override
  int get patients;
  @override
  @JsonKey(ignore: true)
  _$$_SystemStatsCopyWith<_$_SystemStats> get copyWith =>
      throw _privateConstructorUsedError;
}
