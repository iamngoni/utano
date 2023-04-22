// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_District _$$_DistrictFromJson(Map<String, dynamic> json) => _$_District(
      id: json['id'] as String,
      name: json['name'] as String,
      province: json['province'] == null
          ? null
          : Province.fromJson(json['province'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DistrictToJson(_$_District instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('province', instance.province?.toJson());
  return val;
}
