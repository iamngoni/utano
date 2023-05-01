// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dispense _$$_DispenseFromJson(Map<String, dynamic> json) => _$_Dispense(
      id: json['id'] as String,
      prescription: json['prescription'] as String,
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => DispenseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCost: (json['total_cost'] as num).toDouble(),
      totalRtgsCost: (json['total_rtgs_cost'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DispenseToJson(_$_Dispense instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'prescription': instance.prescription,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payment', instance.payment?.toJson());
  val['items'] = instance.items.map((e) => e.toJson()).toList();
  val['total_cost'] = instance.totalCost;
  val['total_rtgs_cost'] = instance.totalRtgsCost;
  return val;
}
