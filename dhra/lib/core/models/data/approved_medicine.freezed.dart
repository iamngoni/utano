// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approved_medicine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApprovedMedicine _$ApprovedMedicineFromJson(Map<String, dynamic> json) {
  return _ApprovedMedicine.fromJson(json);
}

/// @nodoc
mixin _$ApprovedMedicine {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApprovedMedicineCopyWith<ApprovedMedicine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovedMedicineCopyWith<$Res> {
  factory $ApprovedMedicineCopyWith(
          ApprovedMedicine value, $Res Function(ApprovedMedicine) then) =
      _$ApprovedMedicineCopyWithImpl<$Res, ApprovedMedicine>;
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class _$ApprovedMedicineCopyWithImpl<$Res, $Val extends ApprovedMedicine>
    implements $ApprovedMedicineCopyWith<$Res> {
  _$ApprovedMedicineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApprovedMedicineCopyWith<$Res>
    implements $ApprovedMedicineCopyWith<$Res> {
  factory _$$_ApprovedMedicineCopyWith(
          _$_ApprovedMedicine value, $Res Function(_$_ApprovedMedicine) then) =
      __$$_ApprovedMedicineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class __$$_ApprovedMedicineCopyWithImpl<$Res>
    extends _$ApprovedMedicineCopyWithImpl<$Res, _$_ApprovedMedicine>
    implements _$$_ApprovedMedicineCopyWith<$Res> {
  __$$_ApprovedMedicineCopyWithImpl(
      _$_ApprovedMedicine _value, $Res Function(_$_ApprovedMedicine) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$_ApprovedMedicine(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
class _$_ApprovedMedicine extends _ApprovedMedicine {
  const _$_ApprovedMedicine(
      {required this.id, required this.name, required this.description})
      : super._();

  factory _$_ApprovedMedicine.fromJson(Map<String, dynamic> json) =>
      _$$_ApprovedMedicineFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'ApprovedMedicine(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApprovedMedicine &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApprovedMedicineCopyWith<_$_ApprovedMedicine> get copyWith =>
      __$$_ApprovedMedicineCopyWithImpl<_$_ApprovedMedicine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApprovedMedicineToJson(
      this,
    );
  }
}

abstract class _ApprovedMedicine extends ApprovedMedicine {
  const factory _ApprovedMedicine(
      {required final String id,
      required final String name,
      required final String description}) = _$_ApprovedMedicine;
  const _ApprovedMedicine._() : super._();

  factory _ApprovedMedicine.fromJson(Map<String, dynamic> json) =
      _$_ApprovedMedicine.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_ApprovedMedicineCopyWith<_$_ApprovedMedicine> get copyWith =>
      throw _privateConstructorUsedError;
}
