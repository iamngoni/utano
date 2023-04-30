// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drug.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Drug _$DrugFromJson(Map<String, dynamic> json) {
  return _Drug.fromJson(json);
}

/// @nodoc
mixin _$Drug {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugCopyWith<Drug> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugCopyWith<$Res> {
  factory $DrugCopyWith(Drug value, $Res Function(Drug) then) =
      _$DrugCopyWithImpl<$Res, Drug>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      int quantity,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class _$DrugCopyWithImpl<$Res, $Val extends Drug>
    implements $DrugCopyWith<$Res> {
  _$DrugCopyWithImpl(this._value, this._then);

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
    Object? price = null,
    Object? quantity = null,
    Object? isActive = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DrugCopyWith<$Res> implements $DrugCopyWith<$Res> {
  factory _$$_DrugCopyWith(_$_Drug value, $Res Function(_$_Drug) then) =
      __$$_DrugCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      int quantity,
      @JsonKey(name: 'is_active') bool isActive});
}

/// @nodoc
class __$$_DrugCopyWithImpl<$Res> extends _$DrugCopyWithImpl<$Res, _$_Drug>
    implements _$$_DrugCopyWith<$Res> {
  __$$_DrugCopyWithImpl(_$_Drug _value, $Res Function(_$_Drug) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? quantity = null,
    Object? isActive = null,
  }) {
    return _then(_$_Drug(
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Drug implements _Drug {
  const _$_Drug(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      @JsonKey(name: 'is_active') required this.isActive});

  factory _$_Drug.fromJson(Map<String, dynamic> json) => _$$_DrugFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;

  @override
  String toString() {
    return 'Drug(id: $id, name: $name, description: $description, price: $price, quantity: $quantity, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Drug &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, price, quantity, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DrugCopyWith<_$_Drug> get copyWith =>
      __$$_DrugCopyWithImpl<_$_Drug>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DrugToJson(
      this,
    );
  }
}

abstract class _Drug implements Drug {
  const factory _Drug(
      {required final String id,
      required final String name,
      required final String description,
      required final double price,
      required final int quantity,
      @JsonKey(name: 'is_active') required final bool isActive}) = _$_Drug;

  factory _Drug.fromJson(Map<String, dynamic> json) = _$_Drug.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_DrugCopyWith<_$_Drug> get copyWith => throw _privateConstructorUsedError;
}
