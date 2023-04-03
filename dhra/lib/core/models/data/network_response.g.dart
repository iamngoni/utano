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

Map<String, dynamic> _$$_NetworkResponseToJson(_$_NetworkResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
