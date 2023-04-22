// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkResponse _$$_NetworkResponseFromJson(Map<String, dynamic> json) =>
    _$_NetworkResponse(
      status: json['status'] as bool,
      data: json['data'] as Map<String, dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_NetworkResponseToJson(_$_NetworkResponse instance) {
  final val = <String, dynamic>{
    'status': instance.status,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('message', instance.message);
  return val;
}
