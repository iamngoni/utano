// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_prescription_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PosPrescriptionItem _$$_PosPrescriptionItemFromJson(
        Map<String, dynamic> json) =>
    _$_PosPrescriptionItem(
      drug: Drug.fromJson(json['drug'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_PosPrescriptionItemToJson(
        _$_PosPrescriptionItem instance) =>
    <String, dynamic>{
      'drug': instance.drug.toJson(),
      'count': instance.count,
    };
