// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrescriptionItem _$$_PrescriptionItemFromJson(Map<String, dynamic> json) =>
    _$_PrescriptionItem(
      frequency: json['frequency'] as int,
      id: json['id'] as String,
      instructions: json['instructions'] as String,
      medicine: json['medicine'] as String,
      medicineId: json['medicine_id'] as String,
      prescription: json['prescription'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$_PrescriptionItemToJson(_$_PrescriptionItem instance) =>
    <String, dynamic>{
      'frequency': instance.frequency,
      'id': instance.id,
      'instructions': instance.instructions,
      'medicine': instance.medicine,
      'medicine_id': instance.medicineId,
      'prescription': instance.prescription,
      'quantity': instance.quantity,
    };
