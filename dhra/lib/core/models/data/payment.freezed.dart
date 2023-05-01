// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'rtgs_amount')
  double get rtgsAmount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get paid => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider_response')
  String? get providerResponse => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_option_info_1')
  String? get paymentOptionInfo1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_option_info_2')
  String? get paymentOptionInfo2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_option_info_3')
  String? get paymentOptionInfo3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_option_info_4')
  String? get paymentOptionInfo4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_option_info_5')
  String? get paymentOptionInfo5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_link')
  String? get paymentLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_name')
  String get patientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_phone')
  String? get patientPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_email')
  String? get patientEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      double amount,
      @JsonKey(name: 'rtgs_amount') double rtgsAmount,
      String description,
      bool paid,
      String status,
      @JsonKey(name: 'payment_method') PaymentMethod paymentMethod,
      @JsonKey(name: 'provider_response') String? providerResponse,
      @JsonKey(name: 'payment_option_info_1') String? paymentOptionInfo1,
      @JsonKey(name: 'payment_option_info_2') String? paymentOptionInfo2,
      @JsonKey(name: 'payment_option_info_3') String? paymentOptionInfo3,
      @JsonKey(name: 'payment_option_info_4') String? paymentOptionInfo4,
      @JsonKey(name: 'payment_option_info_5') String? paymentOptionInfo5,
      @JsonKey(name: 'payment_link') String? paymentLink,
      @JsonKey(name: 'patient_name') String patientName,
      @JsonKey(name: 'patient_phone') String? patientPhone,
      @JsonKey(name: 'patient_email') String? patientEmail});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? amount = null,
    Object? rtgsAmount = null,
    Object? description = null,
    Object? paid = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? providerResponse = freezed,
    Object? paymentOptionInfo1 = freezed,
    Object? paymentOptionInfo2 = freezed,
    Object? paymentOptionInfo3 = freezed,
    Object? paymentOptionInfo4 = freezed,
    Object? paymentOptionInfo5 = freezed,
    Object? paymentLink = freezed,
    Object? patientName = null,
    Object? patientPhone = freezed,
    Object? patientEmail = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      rtgsAmount: null == rtgsAmount
          ? _value.rtgsAmount
          : rtgsAmount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      providerResponse: freezed == providerResponse
          ? _value.providerResponse
          : providerResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo1: freezed == paymentOptionInfo1
          ? _value.paymentOptionInfo1
          : paymentOptionInfo1 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo2: freezed == paymentOptionInfo2
          ? _value.paymentOptionInfo2
          : paymentOptionInfo2 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo3: freezed == paymentOptionInfo3
          ? _value.paymentOptionInfo3
          : paymentOptionInfo3 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo4: freezed == paymentOptionInfo4
          ? _value.paymentOptionInfo4
          : paymentOptionInfo4 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo5: freezed == paymentOptionInfo5
          ? _value.paymentOptionInfo5
          : paymentOptionInfo5 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentLink: freezed == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: null == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String,
      patientPhone: freezed == patientPhone
          ? _value.patientPhone
          : patientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      patientEmail: freezed == patientEmail
          ? _value.patientEmail
          : patientEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$_PaymentCopyWith(
          _$_Payment value, $Res Function(_$_Payment) then) =
      __$$_PaymentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      double amount,
      @JsonKey(name: 'rtgs_amount') double rtgsAmount,
      String description,
      bool paid,
      String status,
      @JsonKey(name: 'payment_method') PaymentMethod paymentMethod,
      @JsonKey(name: 'provider_response') String? providerResponse,
      @JsonKey(name: 'payment_option_info_1') String? paymentOptionInfo1,
      @JsonKey(name: 'payment_option_info_2') String? paymentOptionInfo2,
      @JsonKey(name: 'payment_option_info_3') String? paymentOptionInfo3,
      @JsonKey(name: 'payment_option_info_4') String? paymentOptionInfo4,
      @JsonKey(name: 'payment_option_info_5') String? paymentOptionInfo5,
      @JsonKey(name: 'payment_link') String? paymentLink,
      @JsonKey(name: 'patient_name') String patientName,
      @JsonKey(name: 'patient_phone') String? patientPhone,
      @JsonKey(name: 'patient_email') String? patientEmail});
}

/// @nodoc
class __$$_PaymentCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$_Payment>
    implements _$$_PaymentCopyWith<$Res> {
  __$$_PaymentCopyWithImpl(_$_Payment _value, $Res Function(_$_Payment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? amount = null,
    Object? rtgsAmount = null,
    Object? description = null,
    Object? paid = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? providerResponse = freezed,
    Object? paymentOptionInfo1 = freezed,
    Object? paymentOptionInfo2 = freezed,
    Object? paymentOptionInfo3 = freezed,
    Object? paymentOptionInfo4 = freezed,
    Object? paymentOptionInfo5 = freezed,
    Object? paymentLink = freezed,
    Object? patientName = null,
    Object? patientPhone = freezed,
    Object? patientEmail = freezed,
  }) {
    return _then(_$_Payment(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      rtgsAmount: null == rtgsAmount
          ? _value.rtgsAmount
          : rtgsAmount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      providerResponse: freezed == providerResponse
          ? _value.providerResponse
          : providerResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo1: freezed == paymentOptionInfo1
          ? _value.paymentOptionInfo1
          : paymentOptionInfo1 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo2: freezed == paymentOptionInfo2
          ? _value.paymentOptionInfo2
          : paymentOptionInfo2 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo3: freezed == paymentOptionInfo3
          ? _value.paymentOptionInfo3
          : paymentOptionInfo3 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo4: freezed == paymentOptionInfo4
          ? _value.paymentOptionInfo4
          : paymentOptionInfo4 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentOptionInfo5: freezed == paymentOptionInfo5
          ? _value.paymentOptionInfo5
          : paymentOptionInfo5 // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentLink: freezed == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String?,
      patientName: null == patientName
          ? _value.patientName
          : patientName // ignore: cast_nullable_to_non_nullable
              as String,
      patientPhone: freezed == patientPhone
          ? _value.patientPhone
          : patientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      patientEmail: freezed == patientEmail
          ? _value.patientEmail
          : patientEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Payment extends _Payment {
  const _$_Payment(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.amount,
      @JsonKey(name: 'rtgs_amount') required this.rtgsAmount,
      required this.description,
      required this.paid,
      required this.status,
      @JsonKey(name: 'payment_method') required this.paymentMethod,
      @JsonKey(name: 'provider_response') required this.providerResponse,
      @JsonKey(name: 'payment_option_info_1') required this.paymentOptionInfo1,
      @JsonKey(name: 'payment_option_info_2') required this.paymentOptionInfo2,
      @JsonKey(name: 'payment_option_info_3') required this.paymentOptionInfo3,
      @JsonKey(name: 'payment_option_info_4') required this.paymentOptionInfo4,
      @JsonKey(name: 'payment_option_info_5') required this.paymentOptionInfo5,
      @JsonKey(name: 'payment_link') required this.paymentLink,
      @JsonKey(name: 'patient_name') required this.patientName,
      @JsonKey(name: 'patient_phone') required this.patientPhone,
      @JsonKey(name: 'patient_email') required this.patientEmail})
      : super._();

  factory _$_Payment.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final double amount;
  @override
  @JsonKey(name: 'rtgs_amount')
  final double rtgsAmount;
  @override
  final String description;
  @override
  final bool paid;
  @override
  final String status;
  @override
  @JsonKey(name: 'payment_method')
  final PaymentMethod paymentMethod;
  @override
  @JsonKey(name: 'provider_response')
  final String? providerResponse;
  @override
  @JsonKey(name: 'payment_option_info_1')
  final String? paymentOptionInfo1;
  @override
  @JsonKey(name: 'payment_option_info_2')
  final String? paymentOptionInfo2;
  @override
  @JsonKey(name: 'payment_option_info_3')
  final String? paymentOptionInfo3;
  @override
  @JsonKey(name: 'payment_option_info_4')
  final String? paymentOptionInfo4;
  @override
  @JsonKey(name: 'payment_option_info_5')
  final String? paymentOptionInfo5;
  @override
  @JsonKey(name: 'payment_link')
  final String? paymentLink;
  @override
  @JsonKey(name: 'patient_name')
  final String patientName;
  @override
  @JsonKey(name: 'patient_phone')
  final String? patientPhone;
  @override
  @JsonKey(name: 'patient_email')
  final String? patientEmail;

  @override
  String toString() {
    return 'Payment(id: $id, createdAt: $createdAt, amount: $amount, rtgsAmount: $rtgsAmount, description: $description, paid: $paid, status: $status, paymentMethod: $paymentMethod, providerResponse: $providerResponse, paymentOptionInfo1: $paymentOptionInfo1, paymentOptionInfo2: $paymentOptionInfo2, paymentOptionInfo3: $paymentOptionInfo3, paymentOptionInfo4: $paymentOptionInfo4, paymentOptionInfo5: $paymentOptionInfo5, paymentLink: $paymentLink, patientName: $patientName, patientPhone: $patientPhone, patientEmail: $patientEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Payment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.rtgsAmount, rtgsAmount) ||
                other.rtgsAmount == rtgsAmount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.providerResponse, providerResponse) ||
                other.providerResponse == providerResponse) &&
            (identical(other.paymentOptionInfo1, paymentOptionInfo1) ||
                other.paymentOptionInfo1 == paymentOptionInfo1) &&
            (identical(other.paymentOptionInfo2, paymentOptionInfo2) ||
                other.paymentOptionInfo2 == paymentOptionInfo2) &&
            (identical(other.paymentOptionInfo3, paymentOptionInfo3) ||
                other.paymentOptionInfo3 == paymentOptionInfo3) &&
            (identical(other.paymentOptionInfo4, paymentOptionInfo4) ||
                other.paymentOptionInfo4 == paymentOptionInfo4) &&
            (identical(other.paymentOptionInfo5, paymentOptionInfo5) ||
                other.paymentOptionInfo5 == paymentOptionInfo5) &&
            (identical(other.paymentLink, paymentLink) ||
                other.paymentLink == paymentLink) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.patientPhone, patientPhone) ||
                other.patientPhone == patientPhone) &&
            (identical(other.patientEmail, patientEmail) ||
                other.patientEmail == patientEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      amount,
      rtgsAmount,
      description,
      paid,
      status,
      paymentMethod,
      providerResponse,
      paymentOptionInfo1,
      paymentOptionInfo2,
      paymentOptionInfo3,
      paymentOptionInfo4,
      paymentOptionInfo5,
      paymentLink,
      patientName,
      patientPhone,
      patientEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentCopyWith<_$_Payment> get copyWith =>
      __$$_PaymentCopyWithImpl<_$_Payment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentToJson(
      this,
    );
  }
}

abstract class _Payment extends Payment {
  const factory _Payment(
      {required final String id,
      @JsonKey(name: 'created_at')
          required final DateTime createdAt,
      required final double amount,
      @JsonKey(name: 'rtgs_amount')
          required final double rtgsAmount,
      required final String description,
      required final bool paid,
      required final String status,
      @JsonKey(name: 'payment_method')
          required final PaymentMethod paymentMethod,
      @JsonKey(name: 'provider_response')
          required final String? providerResponse,
      @JsonKey(name: 'payment_option_info_1')
          required final String? paymentOptionInfo1,
      @JsonKey(name: 'payment_option_info_2')
          required final String? paymentOptionInfo2,
      @JsonKey(name: 'payment_option_info_3')
          required final String? paymentOptionInfo3,
      @JsonKey(name: 'payment_option_info_4')
          required final String? paymentOptionInfo4,
      @JsonKey(name: 'payment_option_info_5')
          required final String? paymentOptionInfo5,
      @JsonKey(name: 'payment_link')
          required final String? paymentLink,
      @JsonKey(name: 'patient_name')
          required final String patientName,
      @JsonKey(name: 'patient_phone')
          required final String? patientPhone,
      @JsonKey(name: 'patient_email')
          required final String? patientEmail}) = _$_Payment;
  const _Payment._() : super._();

  factory _Payment.fromJson(Map<String, dynamic> json) = _$_Payment.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  double get amount;
  @override
  @JsonKey(name: 'rtgs_amount')
  double get rtgsAmount;
  @override
  String get description;
  @override
  bool get paid;
  @override
  String get status;
  @override
  @JsonKey(name: 'payment_method')
  PaymentMethod get paymentMethod;
  @override
  @JsonKey(name: 'provider_response')
  String? get providerResponse;
  @override
  @JsonKey(name: 'payment_option_info_1')
  String? get paymentOptionInfo1;
  @override
  @JsonKey(name: 'payment_option_info_2')
  String? get paymentOptionInfo2;
  @override
  @JsonKey(name: 'payment_option_info_3')
  String? get paymentOptionInfo3;
  @override
  @JsonKey(name: 'payment_option_info_4')
  String? get paymentOptionInfo4;
  @override
  @JsonKey(name: 'payment_option_info_5')
  String? get paymentOptionInfo5;
  @override
  @JsonKey(name: 'payment_link')
  String? get paymentLink;
  @override
  @JsonKey(name: 'patient_name')
  String get patientName;
  @override
  @JsonKey(name: 'patient_phone')
  String? get patientPhone;
  @override
  @JsonKey(name: 'patient_email')
  String? get patientEmail;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentCopyWith<_$_Payment> get copyWith =>
      throw _privateConstructorUsedError;
}
