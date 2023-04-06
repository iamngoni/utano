// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relationship_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RelationshipType _$RelationshipTypeFromJson(Map<String, dynamic> json) {
  return _RelationshipType.fromJson(json);
}

/// @nodoc
mixin _$RelationshipType {
  String get description => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelationshipTypeCopyWith<RelationshipType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipTypeCopyWith<$Res> {
  factory $RelationshipTypeCopyWith(
          RelationshipType value, $Res Function(RelationshipType) then) =
      _$RelationshipTypeCopyWithImpl<$Res, RelationshipType>;
  @useResult
  $Res call({String description, String value});
}

/// @nodoc
class _$RelationshipTypeCopyWithImpl<$Res, $Val extends RelationshipType>
    implements $RelationshipTypeCopyWith<$Res> {
  _$RelationshipTypeCopyWithImpl(this._value, this._then);

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
abstract class _$$_RelationshipTypeCopyWith<$Res>
    implements $RelationshipTypeCopyWith<$Res> {
  factory _$$_RelationshipTypeCopyWith(
          _$_RelationshipType value, $Res Function(_$_RelationshipType) then) =
      __$$_RelationshipTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String value});
}

/// @nodoc
class __$$_RelationshipTypeCopyWithImpl<$Res>
    extends _$RelationshipTypeCopyWithImpl<$Res, _$_RelationshipType>
    implements _$$_RelationshipTypeCopyWith<$Res> {
  __$$_RelationshipTypeCopyWithImpl(
      _$_RelationshipType _value, $Res Function(_$_RelationshipType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? value = null,
  }) {
    return _then(_$_RelationshipType(
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
class _$_RelationshipType implements _RelationshipType {
  _$_RelationshipType({required this.description, required this.value});

  factory _$_RelationshipType.fromJson(Map<String, dynamic> json) =>
      _$$_RelationshipTypeFromJson(json);

  @override
  final String description;
  @override
  final String value;

  @override
  String toString() {
    return 'RelationshipType(description: $description, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RelationshipType &&
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
  _$$_RelationshipTypeCopyWith<_$_RelationshipType> get copyWith =>
      __$$_RelationshipTypeCopyWithImpl<_$_RelationshipType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RelationshipTypeToJson(
      this,
    );
  }
}

abstract class _RelationshipType implements RelationshipType {
  factory _RelationshipType(
      {required final String description,
      required final String value}) = _$_RelationshipType;

  factory _RelationshipType.fromJson(Map<String, dynamic> json) =
      _$_RelationshipType.fromJson;

  @override
  String get description;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_RelationshipTypeCopyWith<_$_RelationshipType> get copyWith =>
      throw _privateConstructorUsedError;
}
