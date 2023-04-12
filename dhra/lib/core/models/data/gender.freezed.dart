// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gender.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Gender _$GenderFromJson(Map<String, dynamic> json) {
  return _Gender.fromJson(json);
}

/// @nodoc
mixin _$Gender {
  String get value => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenderCopyWith<Gender> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderCopyWith<$Res> {
  factory $GenderCopyWith(Gender value, $Res Function(Gender) then) =
      _$GenderCopyWithImpl<$Res, Gender>;
  @useResult
  $Res call({String value, String description});
}

/// @nodoc
class _$GenderCopyWithImpl<$Res, $Val extends Gender>
    implements $GenderCopyWith<$Res> {
  _$GenderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenderCopyWith<$Res> implements $GenderCopyWith<$Res> {
  factory _$$_GenderCopyWith(_$_Gender value, $Res Function(_$_Gender) then) =
      __$$_GenderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String description});
}

/// @nodoc
class __$$_GenderCopyWithImpl<$Res>
    extends _$GenderCopyWithImpl<$Res, _$_Gender>
    implements _$$_GenderCopyWith<$Res> {
  __$$_GenderCopyWithImpl(_$_Gender _value, $Res Function(_$_Gender) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? description = null,
  }) {
    return _then(_$_Gender(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gender extends _Gender {
  _$_Gender({required this.value, required this.description}) : super._();

  factory _$_Gender.fromJson(Map<String, dynamic> json) =>
      _$$_GenderFromJson(json);

  @override
  final String value;
  @override
  final String description;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gender &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenderCopyWith<_$_Gender> get copyWith =>
      __$$_GenderCopyWithImpl<_$_Gender>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenderToJson(
      this,
    );
  }
}

abstract class _Gender extends Gender {
  factory _Gender(
      {required final String value,
      required final String description}) = _$_Gender;
  _Gender._() : super._();

  factory _Gender.fromJson(Map<String, dynamic> json) = _$_Gender.fromJson;

  @override
  String get value;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_GenderCopyWith<_$_Gender> get copyWith =>
      throw _privateConstructorUsedError;
}
