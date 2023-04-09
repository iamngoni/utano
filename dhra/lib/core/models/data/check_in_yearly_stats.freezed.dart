// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_yearly_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckInYearlyStats _$CheckInYearlyStatsFromJson(Map<String, dynamic> json) {
  return _CheckInYearlyStats.fromJson(json);
}

/// @nodoc
mixin _$CheckInYearlyStats {
  DateTime get month => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckInYearlyStatsCopyWith<CheckInYearlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInYearlyStatsCopyWith<$Res> {
  factory $CheckInYearlyStatsCopyWith(
          CheckInYearlyStats value, $Res Function(CheckInYearlyStats) then) =
      _$CheckInYearlyStatsCopyWithImpl<$Res, CheckInYearlyStats>;
  @useResult
  $Res call({DateTime month, int count});
}

/// @nodoc
class _$CheckInYearlyStatsCopyWithImpl<$Res, $Val extends CheckInYearlyStats>
    implements $CheckInYearlyStatsCopyWith<$Res> {
  _$CheckInYearlyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckInYearlyStatsCopyWith<$Res>
    implements $CheckInYearlyStatsCopyWith<$Res> {
  factory _$$_CheckInYearlyStatsCopyWith(_$_CheckInYearlyStats value,
          $Res Function(_$_CheckInYearlyStats) then) =
      __$$_CheckInYearlyStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime month, int count});
}

/// @nodoc
class __$$_CheckInYearlyStatsCopyWithImpl<$Res>
    extends _$CheckInYearlyStatsCopyWithImpl<$Res, _$_CheckInYearlyStats>
    implements _$$_CheckInYearlyStatsCopyWith<$Res> {
  __$$_CheckInYearlyStatsCopyWithImpl(
      _$_CheckInYearlyStats _value, $Res Function(_$_CheckInYearlyStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? count = null,
  }) {
    return _then(_$_CheckInYearlyStats(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
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
class _$_CheckInYearlyStats implements _CheckInYearlyStats {
  _$_CheckInYearlyStats({required this.month, required this.count});

  factory _$_CheckInYearlyStats.fromJson(Map<String, dynamic> json) =>
      _$$_CheckInYearlyStatsFromJson(json);

  @override
  final DateTime month;
  @override
  final int count;

  @override
  String toString() {
    return 'CheckInYearlyStats(month: $month, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckInYearlyStats &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckInYearlyStatsCopyWith<_$_CheckInYearlyStats> get copyWith =>
      __$$_CheckInYearlyStatsCopyWithImpl<_$_CheckInYearlyStats>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckInYearlyStatsToJson(
      this,
    );
  }
}

abstract class _CheckInYearlyStats implements CheckInYearlyStats {
  factory _CheckInYearlyStats(
      {required final DateTime month,
      required final int count}) = _$_CheckInYearlyStats;

  factory _CheckInYearlyStats.fromJson(Map<String, dynamic> json) =
      _$_CheckInYearlyStats.fromJson;

  @override
  DateTime get month;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_CheckInYearlyStatsCopyWith<_$_CheckInYearlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}
