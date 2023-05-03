// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkResponse _$$_NetworkResponseFromJson(Map<String, dynamic> json) =>
    _$_NetworkResponse(
      status: json['status'] as bool,
      statusDescription: json['status_description'] as String,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
      issues: json['issues'],
      version: (json['version'] as num).toDouble(),
      versionedBy: json['versioned_by'] as String,
    );

Map<String, dynamic> _$$_NetworkResponseToJson(_$_NetworkResponse instance) {
  final val = <String, dynamic>{
    'status': instance.status,
    'status_description': instance.statusDescription,
    'message': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('issues', instance.issues);
  val['version'] = instance.version;
  val['versioned_by'] = instance.versionedBy;
  return val;
}
