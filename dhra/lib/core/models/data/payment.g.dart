// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$$_PaymentFromJson(Map<String, dynamic> json) => _$_Payment(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      amount: (json['amount'] as num).toDouble(),
      rtgsAmount: (json['rtgs_amount'] as num).toDouble(),
      description: json['description'] as String,
      paid: json['paid'] as bool,
      status: json['status'] as String,
      paymentMethod:
          $enumDecode(_$PaymentMethodEnumMap, json['payment_method']),
      providerResponse: json['provider_response'] as String?,
      paymentOptionInfo1: json['payment_option_info_1'] as String?,
      paymentOptionInfo2: json['payment_option_info_2'] as String?,
      paymentOptionInfo3: json['payment_option_info_3'] as String?,
      paymentOptionInfo4: json['payment_option_info_4'] as String?,
      paymentOptionInfo5: json['payment_option_info_5'] as String?,
      paymentLink: json['payment_link'] as String?,
      patientName: json['patient_name'] as String,
      patientPhone: json['patient_phone'] as String?,
      patientEmail: json['patient_email'] as String?,
    );

Map<String, dynamic> _$$_PaymentToJson(_$_Payment instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt.toIso8601String(),
    'amount': instance.amount,
    'rtgs_amount': instance.rtgsAmount,
    'description': instance.description,
    'paid': instance.paid,
    'status': instance.status,
    'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('provider_response', instance.providerResponse);
  writeNotNull('payment_option_info_1', instance.paymentOptionInfo1);
  writeNotNull('payment_option_info_2', instance.paymentOptionInfo2);
  writeNotNull('payment_option_info_3', instance.paymentOptionInfo3);
  writeNotNull('payment_option_info_4', instance.paymentOptionInfo4);
  writeNotNull('payment_option_info_5', instance.paymentOptionInfo5);
  writeNotNull('payment_link', instance.paymentLink);
  val['patient_name'] = instance.patientName;
  writeNotNull('patient_phone', instance.patientPhone);
  writeNotNull('patient_email', instance.patientEmail);
  return val;
}

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.bond: 'bond',
  PaymentMethod.swipe: 'swipe',
  PaymentMethod.ecocash: 'ecocash',
  PaymentMethod.onemoney: 'onemoney',
};
