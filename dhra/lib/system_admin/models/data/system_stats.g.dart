// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SystemStats _$$_SystemStatsFromJson(Map<String, dynamic> json) =>
    _$_SystemStats(
      healthInstitutions: json['health_institutions'] as int,
      employees: json['employees'] as int,
      patients: json['patients'] as int,
    );

Map<String, dynamic> _$$_SystemStatsToJson(_$_SystemStats instance) =>
    <String, dynamic>{
      'health_institutions': instance.healthInstitutions,
      'employees': instance.employees,
      'patients': instance.patients,
    };
