// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  int get patients => throw _privateConstructorUsedError;
  int get employees => throw _privateConstructorUsedError;
  int get rooms => throw _privateConstructorUsedError;
  int get doctors => throw _privateConstructorUsedError;
  int get nurses => throw _privateConstructorUsedError;
  @JsonKey(name: 'lab_technicians')
  int get labTechnicians => throw _privateConstructorUsedError;
  int get admins => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res, Stats>;
  @useResult
  $Res call(
      {int patients,
      int employees,
      int rooms,
      int doctors,
      int nurses,
      @JsonKey(name: 'lab_technicians') int labTechnicians,
      int admins});
}

/// @nodoc
class _$StatsCopyWithImpl<$Res, $Val extends Stats>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patients = null,
    Object? employees = null,
    Object? rooms = null,
    Object? doctors = null,
    Object? nurses = null,
    Object? labTechnicians = null,
    Object? admins = null,
  }) {
    return _then(_value.copyWith(
      patients: null == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as int,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as int,
      doctors: null == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as int,
      nurses: null == nurses
          ? _value.nurses
          : nurses // ignore: cast_nullable_to_non_nullable
              as int,
      labTechnicians: null == labTechnicians
          ? _value.labTechnicians
          : labTechnicians // ignore: cast_nullable_to_non_nullable
              as int,
      admins: null == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatsCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$$_StatsCopyWith(_$_Stats value, $Res Function(_$_Stats) then) =
      __$$_StatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int patients,
      int employees,
      int rooms,
      int doctors,
      int nurses,
      @JsonKey(name: 'lab_technicians') int labTechnicians,
      int admins});
}

/// @nodoc
class __$$_StatsCopyWithImpl<$Res> extends _$StatsCopyWithImpl<$Res, _$_Stats>
    implements _$$_StatsCopyWith<$Res> {
  __$$_StatsCopyWithImpl(_$_Stats _value, $Res Function(_$_Stats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patients = null,
    Object? employees = null,
    Object? rooms = null,
    Object? doctors = null,
    Object? nurses = null,
    Object? labTechnicians = null,
    Object? admins = null,
  }) {
    return _then(_$_Stats(
      patients: null == patients
          ? _value.patients
          : patients // ignore: cast_nullable_to_non_nullable
              as int,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as int,
      doctors: null == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as int,
      nurses: null == nurses
          ? _value.nurses
          : nurses // ignore: cast_nullable_to_non_nullable
              as int,
      labTechnicians: null == labTechnicians
          ? _value.labTechnicians
          : labTechnicians // ignore: cast_nullable_to_non_nullable
              as int,
      admins: null == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stats implements _Stats {
  _$_Stats(
      {required this.patients,
      required this.employees,
      required this.rooms,
      required this.doctors,
      required this.nurses,
      @JsonKey(name: 'lab_technicians') required this.labTechnicians,
      required this.admins});

  factory _$_Stats.fromJson(Map<String, dynamic> json) =>
      _$$_StatsFromJson(json);

  @override
  final int patients;
  @override
  final int employees;
  @override
  final int rooms;
  @override
  final int doctors;
  @override
  final int nurses;
  @override
  @JsonKey(name: 'lab_technicians')
  final int labTechnicians;
  @override
  final int admins;

  @override
  String toString() {
    return 'Stats(patients: $patients, employees: $employees, rooms: $rooms, doctors: $doctors, nurses: $nurses, labTechnicians: $labTechnicians, admins: $admins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stats &&
            (identical(other.patients, patients) ||
                other.patients == patients) &&
            (identical(other.employees, employees) ||
                other.employees == employees) &&
            (identical(other.rooms, rooms) || other.rooms == rooms) &&
            (identical(other.doctors, doctors) || other.doctors == doctors) &&
            (identical(other.nurses, nurses) || other.nurses == nurses) &&
            (identical(other.labTechnicians, labTechnicians) ||
                other.labTechnicians == labTechnicians) &&
            (identical(other.admins, admins) || other.admins == admins));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, patients, employees, rooms,
      doctors, nurses, labTechnicians, admins);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      __$$_StatsCopyWithImpl<_$_Stats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatsToJson(
      this,
    );
  }
}

abstract class _Stats implements Stats {
  factory _Stats(
      {required final int patients,
      required final int employees,
      required final int rooms,
      required final int doctors,
      required final int nurses,
      @JsonKey(name: 'lab_technicians') required final int labTechnicians,
      required final int admins}) = _$_Stats;

  factory _Stats.fromJson(Map<String, dynamic> json) = _$_Stats.fromJson;

  @override
  int get patients;
  @override
  int get employees;
  @override
  int get rooms;
  @override
  int get doctors;
  @override
  int get nurses;
  @override
  @JsonKey(name: 'lab_technicians')
  int get labTechnicians;
  @override
  int get admins;
  @override
  @JsonKey(ignore: true)
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      throw _privateConstructorUsedError;
}
