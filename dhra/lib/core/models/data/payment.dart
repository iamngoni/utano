//
//  payment
//  dhra
//
//  Created by Ngonidzashe Mangudya on 1/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import 'model.dart';
import 'payment_method.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment implements Model {
  const factory Payment({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required double amount,
    @JsonKey(name: 'rtgs_amount') required double rtgsAmount,
    required String description,
    required bool paid,
    required String status,
    @JsonKey(name: 'payment_method') required PaymentMethod paymentMethod,
    @JsonKey(name: 'provider_response') required String? providerResponse,
    @JsonKey(name: 'payment_option_info_1') required String? paymentOptionInfo1,
    @JsonKey(name: 'payment_option_info_2') required String? paymentOptionInfo2,
    @JsonKey(name: 'payment_option_info_3') required String? paymentOptionInfo3,
    @JsonKey(name: 'payment_option_info_4') required String? paymentOptionInfo4,
    @JsonKey(name: 'payment_option_info_5') required String? paymentOptionInfo5,
    @JsonKey(name: 'payment_link') required String? paymentLink,
    @JsonKey(name: 'patient_name') required String patientName,
    @JsonKey(name: 'patient_phone') required String? patientPhone,
    @JsonKey(name: 'patient_email') required String? patientEmail,
  }) = _Payment;

  const Payment._();

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
