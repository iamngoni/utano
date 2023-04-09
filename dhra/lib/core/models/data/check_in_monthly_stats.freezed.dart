// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_monthly_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckInMonthlyStats _$CheckInMonthlyStatsFromJson(Map<String, dynamic> json) {
  return _CheckInMonthlyStats.fromJson(json);
}

/// @nodoc
mixin _$CheckInMonthlyStats {
  DateTime get day => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckInMonthlyStatsCopyWith<CheckInMonthlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInMonthlyStatsCopyWith<$Res> {
  factory $CheckInMonthlyStatsCopyWith(
          CheckInMonthlyStats value, $Res Function(CheckInMonthlyStats) then) =
      _$CheckInMonthlyStatsCopyWithImpl<$Res, CheckInMonthlyStats>;
  @useResult
  $Res call({DateTime day, int count});
}

/// @nodoc
class _$CheckInMonthlyStatsCopyWithImpl<$Res, $Val extends CheckInMonthlyStats>
    implements $CheckInMonthlyStatsCopyWith<$Res> {
  _$CheckInMonthlyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckInMonthlyStatsCopyWith<$Res>
    implements $CheckInMonthlyStatsCopyWith<$Res> {
  factory _$$_CheckInMonthlyStatsCopyWith(_$_CheckInMonthlyStats value,
          $Res Function(_$_CheckInMonthlyStats) then) =
      __$$_CheckInMonthlyStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime day, int count});
}

/// @nodoc
class __$$_CheckInMonthlyStatsCopyWithImpl<$Res>
    extends _$CheckInMonthlyStatsCopyWithImpl<$Res, _$_CheckInMonthlyStats>
    implements _$$_CheckInMonthlyStatsCopyWith<$Res> {
  __$$_CheckInMonthlyStatsCopyWithImpl(_$_CheckInMonthlyStats _value,
      $Res Function(_$_CheckInMonthlyStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? count = null,
  }) {
    return _then(_$_CheckInMonthlyStats(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckInMonthlyStats implements _CheckInMonthlyStats {
  _$_CheckInMonthlyStats({required this.day, required this.count});

  factory _$_CheckInMonthlyStats.fromJson(Map<String, dynamic> json) =>
      _$$_CheckInMonthlyStatsFromJson(json);

  @override
  final DateTime day;
  @override
  final int count;

  @override
  String toString() {
    return 'CheckInMonthlyStats(day: $day, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckInMonthlyStats &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckInMonthlyStatsCopyWith<_$_CheckInMonthlyStats> get copyWith =>
      __$$_CheckInMonthlyStatsCopyWithImpl<_$_CheckInMonthlyStats>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckInMonthlyStatsToJson(
      this,
    );
  }
}

abstract class _CheckInMonthlyStats implements CheckInMonthlyStats {
  factory _CheckInMonthlyStats(
      {required final DateTime day,
      required final int count}) = _$_CheckInMonthlyStats;

  factory _CheckInMonthlyStats.fromJson(Map<String, dynamic> json) =
      _$_CheckInMonthlyStats.fromJson;

  @override
  DateTime get day;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_CheckInMonthlyStatsCopyWith<_$_CheckInMonthlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}
