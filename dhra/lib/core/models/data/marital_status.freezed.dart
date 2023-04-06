// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marital_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaritalStatus _$MaritalStatusFromJson(Map<String, dynamic> json) {
  return _MaritalStatus.fromJson(json);
}

/// @nodoc
mixin _$MaritalStatus {
  String get description => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaritalStatusCopyWith<MaritalStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaritalStatusCopyWith<$Res> {
  factory $MaritalStatusCopyWith(
          MaritalStatus value, $Res Function(MaritalStatus) then) =
      _$MaritalStatusCopyWithImpl<$Res, MaritalStatus>;
  @useResult
  $Res call({String description, String value});
}

/// @nodoc
class _$MaritalStatusCopyWithImpl<$Res, $Val extends MaritalStatus>
    implements $MaritalStatusCopyWith<$Res> {
  _$MaritalStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaritalStatusCopyWith<$Res>
    implements $MaritalStatusCopyWith<$Res> {
  factory _$$_MaritalStatusCopyWith(
          _$_MaritalStatus value, $Res Function(_$_MaritalStatus) then) =
      __$$_MaritalStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String value});
}

/// @nodoc
class __$$_MaritalStatusCopyWithImpl<$Res>
    extends _$MaritalStatusCopyWithImpl<$Res, _$_MaritalStatus>
    implements _$$_MaritalStatusCopyWith<$Res> {
  __$$_MaritalStatusCopyWithImpl(
      _$_MaritalStatus _value, $Res Function(_$_MaritalStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? value = null,
  }) {
    return _then(_$_MaritalStatus(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaritalStatus implements _MaritalStatus {
  _$_MaritalStatus({required this.description, required this.value});

  factory _$_MaritalStatus.fromJson(Map<String, dynamic> json) =>
      _$$_MaritalStatusFromJson(json);

  @override
  final String description;
  @override
  final String value;

  @override
  String toString() {
    return 'MaritalStatus(description: $description, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaritalStatus &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaritalStatusCopyWith<_$_MaritalStatus> get copyWith =>
      __$$_MaritalStatusCopyWithImpl<_$_MaritalStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaritalStatusToJson(
      this,
    );
  }
}

abstract class _MaritalStatus implements MaritalStatus {
  factory _MaritalStatus(
      {required final String description,
      required final String value}) = _$_MaritalStatus;

  factory _MaritalStatus.fromJson(Map<String, dynamic> json) =
      _$_MaritalStatus.fromJson;

  @override
  String get description;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_MaritalStatusCopyWith<_$_MaritalStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
