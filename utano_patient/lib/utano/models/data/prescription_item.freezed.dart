// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrescriptionItem _$PrescriptionItemFromJson(Map<String, dynamic> json) {
  return _PrescriptionItem.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionItem {
  int get frequency => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get instructions => throw _privateConstructorUsedError;
  String get medicine => throw _privateConstructorUsedError;
  @JsonKey(name: 'medicine_id')
  String get medicineId => throw _privateConstructorUsedError;
  String get prescription => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrescriptionItemCopyWith<PrescriptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionItemCopyWith<$Res> {
  factory $PrescriptionItemCopyWith(
          PrescriptionItem value, $Res Function(PrescriptionItem) then) =
      _$PrescriptionItemCopyWithImpl<$Res, PrescriptionItem>;
  @useResult
  $Res call(
      {int frequency,
      String id,
      String instructions,
      String medicine,
      @JsonKey(name: 'medicine_id') String medicineId,
      String prescription,
      int quantity});
}

/// @nodoc
class _$PrescriptionItemCopyWithImpl<$Res, $Val extends PrescriptionItem>
    implements $PrescriptionItemCopyWith<$Res> {
  _$PrescriptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? id = null,
    Object? instructions = null,
    Object? medicine = null,
    Object? medicineId = null,
    Object? prescription = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      medicine: null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as String,
      medicineId: null == medicineId
          ? _value.medicineId
          : medicineId // ignore: cast_nullable_to_non_nullable
              as String,
      prescription: null == prescription
          ? _value.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrescriptionItemCopyWith<$Res>
    implements $PrescriptionItemCopyWith<$Res> {
  factory _$$_PrescriptionItemCopyWith(
          _$_PrescriptionItem value, $Res Function(_$_PrescriptionItem) then) =
      __$$_PrescriptionItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int frequency,
      String id,
      String instructions,
      String medicine,
      @JsonKey(name: 'medicine_id') String medicineId,
      String prescription,
      int quantity});
}

/// @nodoc
class __$$_PrescriptionItemCopyWithImpl<$Res>
    extends _$PrescriptionItemCopyWithImpl<$Res, _$_PrescriptionItem>
    implements _$$_PrescriptionItemCopyWith<$Res> {
  __$$_PrescriptionItemCopyWithImpl(
      _$_PrescriptionItem _value, $Res Function(_$_PrescriptionItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? id = null,
    Object? instructions = null,
    Object? medicine = null,
    Object? medicineId = null,
    Object? prescription = null,
    Object? quantity = null,
  }) {
    return _then(_$_PrescriptionItem(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      medicine: null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as String,
      medicineId: null == medicineId
          ? _value.medicineId
          : medicineId // ignore: cast_nullable_to_non_nullable
              as String,
      prescription: null == prescription
          ? _value.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
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
class _$_PrescriptionItem extends _PrescriptionItem {
  const _$_PrescriptionItem(
      {required this.frequency,
      required this.id,
      required this.instructions,
      required this.medicine,
      @JsonKey(name: 'medicine_id') required this.medicineId,
      required this.prescription,
      required this.quantity})
      : super._();

  factory _$_PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$$_PrescriptionItemFromJson(json);

  @override
  final int frequency;
  @override
  final String id;
  @override
  final String instructions;
  @override
  final String medicine;
  @override
  @JsonKey(name: 'medicine_id')
  final String medicineId;
  @override
  final String prescription;
  @override
  final int quantity;

  @override
  String toString() {
    return 'PrescriptionItem(frequency: $frequency, id: $id, instructions: $instructions, medicine: $medicine, medicineId: $medicineId, prescription: $prescription, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrescriptionItem &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.medicineId, medicineId) ||
                other.medicineId == medicineId) &&
            (identical(other.prescription, prescription) ||
                other.prescription == prescription) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, frequency, id, instructions,
      medicine, medicineId, prescription, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrescriptionItemCopyWith<_$_PrescriptionItem> get copyWith =>
      __$$_PrescriptionItemCopyWithImpl<_$_PrescriptionItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrescriptionItemToJson(
      this,
    );
  }
}

abstract class _PrescriptionItem extends PrescriptionItem {
  const factory _PrescriptionItem(
      {required final int frequency,
      required final String id,
      required final String instructions,
      required final String medicine,
      @JsonKey(name: 'medicine_id') required final String medicineId,
      required final String prescription,
      required final int quantity}) = _$_PrescriptionItem;
  const _PrescriptionItem._() : super._();

  factory _PrescriptionItem.fromJson(Map<String, dynamic> json) =
      _$_PrescriptionItem.fromJson;

  @override
  int get frequency;
  @override
  String get id;
  @override
  String get instructions;
  @override
  String get medicine;
  @override
  @JsonKey(name: 'medicine_id')
  String get medicineId;
  @override
  String get prescription;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_PrescriptionItemCopyWith<_$_PrescriptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}
