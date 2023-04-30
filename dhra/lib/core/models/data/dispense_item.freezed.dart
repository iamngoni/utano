// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispense_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DispenseItem _$DispenseItemFromJson(Map<String, dynamic> json) {
  return _DispenseItem.fromJson(json);
}

/// @nodoc
mixin _$DispenseItem {
  String get drug => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DispenseItemCopyWith<DispenseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DispenseItemCopyWith<$Res> {
  factory $DispenseItemCopyWith(
          DispenseItem value, $Res Function(DispenseItem) then) =
      _$DispenseItemCopyWithImpl<$Res, DispenseItem>;
  @useResult
  $Res call({String drug, int quantity});
}

/// @nodoc
class _$DispenseItemCopyWithImpl<$Res, $Val extends DispenseItem>
    implements $DispenseItemCopyWith<$Res> {
  _$DispenseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drug = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      drug: null == drug
          ? _value.drug
          : drug // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DispenseItemCopyWith<$Res>
    implements $DispenseItemCopyWith<$Res> {
  factory _$$_DispenseItemCopyWith(
          _$_DispenseItem value, $Res Function(_$_DispenseItem) then) =
      __$$_DispenseItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String drug, int quantity});
}

/// @nodoc
class __$$_DispenseItemCopyWithImpl<$Res>
    extends _$DispenseItemCopyWithImpl<$Res, _$_DispenseItem>
    implements _$$_DispenseItemCopyWith<$Res> {
  __$$_DispenseItemCopyWithImpl(
      _$_DispenseItem _value, $Res Function(_$_DispenseItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drug = null,
    Object? quantity = null,
  }) {
    return _then(_$_DispenseItem(
      drug: null == drug
          ? _value.drug
          : drug // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DispenseItem extends _DispenseItem {
  const _$_DispenseItem({required this.drug, required this.quantity})
      : super._();

  factory _$_DispenseItem.fromJson(Map<String, dynamic> json) =>
      _$$_DispenseItemFromJson(json);

  @override
  final String drug;
  @override
  final int quantity;

  @override
  String toString() {
    return 'DispenseItem(drug: $drug, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DispenseItem &&
            (identical(other.drug, drug) || other.drug == drug) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, drug, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DispenseItemCopyWith<_$_DispenseItem> get copyWith =>
      __$$_DispenseItemCopyWithImpl<_$_DispenseItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DispenseItemToJson(
      this,
    );
  }
}

abstract class _DispenseItem extends DispenseItem {
  const factory _DispenseItem(
      {required final String drug,
      required final int quantity}) = _$_DispenseItem;
  const _DispenseItem._() : super._();

  factory _DispenseItem.fromJson(Map<String, dynamic> json) =
      _$_DispenseItem.fromJson;

  @override
  String get drug;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_DispenseItemCopyWith<_$_DispenseItem> get copyWith =>
      throw _privateConstructorUsedError;
}
