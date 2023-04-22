// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_prescription_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PosPrescriptionItem _$PosPrescriptionItemFromJson(Map<String, dynamic> json) {
  return _PosPrescriptionItem.fromJson(json);
}

/// @nodoc
mixin _$PosPrescriptionItem {
  ApprovedMedicine get medicine => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosPrescriptionItemCopyWith<PosPrescriptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosPrescriptionItemCopyWith<$Res> {
  factory $PosPrescriptionItemCopyWith(
          PosPrescriptionItem value, $Res Function(PosPrescriptionItem) then) =
      _$PosPrescriptionItemCopyWithImpl<$Res, PosPrescriptionItem>;
  @useResult
  $Res call({ApprovedMedicine medicine, int count});

  $ApprovedMedicineCopyWith<$Res> get medicine;
}

/// @nodoc
class _$PosPrescriptionItemCopyWithImpl<$Res, $Val extends PosPrescriptionItem>
    implements $PosPrescriptionItemCopyWith<$Res> {
  _$PosPrescriptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      medicine: null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as ApprovedMedicine,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApprovedMedicineCopyWith<$Res> get medicine {
    return $ApprovedMedicineCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PosPrescriptionItemCopyWith<$Res>
    implements $PosPrescriptionItemCopyWith<$Res> {
  factory _$$_PosPrescriptionItemCopyWith(_$_PosPrescriptionItem value,
          $Res Function(_$_PosPrescriptionItem) then) =
      __$$_PosPrescriptionItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApprovedMedicine medicine, int count});

  @override
  $ApprovedMedicineCopyWith<$Res> get medicine;
}

/// @nodoc
class __$$_PosPrescriptionItemCopyWithImpl<$Res>
    extends _$PosPrescriptionItemCopyWithImpl<$Res, _$_PosPrescriptionItem>
    implements _$$_PosPrescriptionItemCopyWith<$Res> {
  __$$_PosPrescriptionItemCopyWithImpl(_$_PosPrescriptionItem _value,
      $Res Function(_$_PosPrescriptionItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicine = null,
    Object? count = null,
  }) {
    return _then(_$_PosPrescriptionItem(
      medicine: null == medicine
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as ApprovedMedicine,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PosPrescriptionItem extends _PosPrescriptionItem {
  const _$_PosPrescriptionItem({required this.medicine, required this.count})
      : super._();

  factory _$_PosPrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$$_PosPrescriptionItemFromJson(json);

  @override
  final ApprovedMedicine medicine;
  @override
  final int count;

  @override
  String toString() {
    return 'PosPrescriptionItem(medicine: $medicine, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PosPrescriptionItem &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, medicine, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PosPrescriptionItemCopyWith<_$_PosPrescriptionItem> get copyWith =>
      __$$_PosPrescriptionItemCopyWithImpl<_$_PosPrescriptionItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PosPrescriptionItemToJson(
      this,
    );
  }
}

abstract class _PosPrescriptionItem extends PosPrescriptionItem {
  const factory _PosPrescriptionItem(
      {required final ApprovedMedicine medicine,
      required final int count}) = _$_PosPrescriptionItem;
  const _PosPrescriptionItem._() : super._();

  factory _PosPrescriptionItem.fromJson(Map<String, dynamic> json) =
      _$_PosPrescriptionItem.fromJson;

  @override
  ApprovedMedicine get medicine;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_PosPrescriptionItemCopyWith<_$_PosPrescriptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}
