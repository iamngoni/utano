// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dispense _$DispenseFromJson(Map<String, dynamic> json) {
  return _Dispense.fromJson(json);
}

/// @nodoc
mixin _$Dispense {
  String get id => throw _privateConstructorUsedError;
  String get prescription => throw _privateConstructorUsedError;
  dynamic get payment => throw _privateConstructorUsedError;
  List<DispenseItem> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cost')
  double get totalCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_rtgs_cost')
  double get totalRtgsCost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DispenseCopyWith<Dispense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DispenseCopyWith<$Res> {
  factory $DispenseCopyWith(Dispense value, $Res Function(Dispense) then) =
      _$DispenseCopyWithImpl<$Res, Dispense>;
  @useResult
  $Res call(
      {String id,
      String prescription,
      dynamic payment,
      List<DispenseItem> items,
      @JsonKey(name: 'total_cost') double totalCost,
      @JsonKey(name: 'total_rtgs_cost') double totalRtgsCost});
}

/// @nodoc
class _$DispenseCopyWithImpl<$Res, $Val extends Dispense>
    implements $DispenseCopyWith<$Res> {
  _$DispenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prescription = null,
    Object? payment = freezed,
    Object? items = null,
    Object? totalCost = null,
    Object? totalRtgsCost = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      prescription: null == prescription
          ? _value.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
              as String,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as dynamic,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DispenseItem>,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalRtgsCost: null == totalRtgsCost
          ? _value.totalRtgsCost
          : totalRtgsCost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DispenseCopyWith<$Res> implements $DispenseCopyWith<$Res> {
  factory _$$_DispenseCopyWith(
          _$_Dispense value, $Res Function(_$_Dispense) then) =
      __$$_DispenseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String prescription,
      dynamic payment,
      List<DispenseItem> items,
      @JsonKey(name: 'total_cost') double totalCost,
      @JsonKey(name: 'total_rtgs_cost') double totalRtgsCost});
}

/// @nodoc
class __$$_DispenseCopyWithImpl<$Res>
    extends _$DispenseCopyWithImpl<$Res, _$_Dispense>
    implements _$$_DispenseCopyWith<$Res> {
  __$$_DispenseCopyWithImpl(
      _$_Dispense _value, $Res Function(_$_Dispense) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prescription = null,
    Object? payment = freezed,
    Object? items = null,
    Object? totalCost = null,
    Object? totalRtgsCost = null,
  }) {
    return _then(_$_Dispense(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      prescription: null == prescription
          ? _value.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
              as String,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as dynamic,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DispenseItem>,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalRtgsCost: null == totalRtgsCost
          ? _value.totalRtgsCost
          : totalRtgsCost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dispense extends _Dispense {
  const _$_Dispense(
      {required this.id,
      required this.prescription,
      required this.payment,
      required final List<DispenseItem> items,
      @JsonKey(name: 'total_cost') required this.totalCost,
      @JsonKey(name: 'total_rtgs_cost') required this.totalRtgsCost})
      : _items = items,
        super._();

  factory _$_Dispense.fromJson(Map<String, dynamic> json) =>
      _$$_DispenseFromJson(json);

  @override
  final String id;
  @override
  final String prescription;
  @override
  final dynamic payment;
  final List<DispenseItem> _items;
  @override
  List<DispenseItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'total_cost')
  final double totalCost;
  @override
  @JsonKey(name: 'total_rtgs_cost')
  final double totalRtgsCost;

  @override
  String toString() {
    return 'Dispense(id: $id, prescription: $prescription, payment: $payment, items: $items, totalCost: $totalCost, totalRtgsCost: $totalRtgsCost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dispense &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prescription, prescription) ||
                other.prescription == prescription) &&
            const DeepCollectionEquality().equals(other.payment, payment) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalRtgsCost, totalRtgsCost) ||
                other.totalRtgsCost == totalRtgsCost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      prescription,
      const DeepCollectionEquality().hash(payment),
      const DeepCollectionEquality().hash(_items),
      totalCost,
      totalRtgsCost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DispenseCopyWith<_$_Dispense> get copyWith =>
      __$$_DispenseCopyWithImpl<_$_Dispense>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DispenseToJson(
      this,
    );
  }
}

abstract class _Dispense extends Dispense {
  const factory _Dispense(
      {required final String id,
      required final String prescription,
      required final dynamic payment,
      required final List<DispenseItem> items,
      @JsonKey(name: 'total_cost')
          required final double totalCost,
      @JsonKey(name: 'total_rtgs_cost')
          required final double totalRtgsCost}) = _$_Dispense;
  const _Dispense._() : super._();

  factory _Dispense.fromJson(Map<String, dynamic> json) = _$_Dispense.fromJson;

  @override
  String get id;
  @override
  String get prescription;
  @override
  dynamic get payment;
  @override
  List<DispenseItem> get items;
  @override
  @JsonKey(name: 'total_cost')
  double get totalCost;
  @override
  @JsonKey(name: 'total_rtgs_cost')
  double get totalRtgsCost;
  @override
  @JsonKey(ignore: true)
  _$$_DispenseCopyWith<_$_Dispense> get copyWith =>
      throw _privateConstructorUsedError;
}
