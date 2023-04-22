// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_prescription_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PosPrescriptionItem _$$_PosPrescriptionItemFromJson(
        Map<String, dynamic> json) =>
    _$_PosPrescriptionItem(
      medicine:
          ApprovedMedicine.fromJson(json['medicine'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_PosPrescriptionItemToJson(
        _$_PosPrescriptionItem instance) =>
    <String, dynamic>{
      'medicine': instance.medicine.toJson(),
      'count': instance.count,
    };
