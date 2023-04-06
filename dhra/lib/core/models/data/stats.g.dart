// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stats _$$_StatsFromJson(Map<String, dynamic> json) => _$_Stats(
      patient: json['patient'] as int,
      employees: json['employees'] as int,
      rooms: json['rooms'] as int,
      doctors: json['doctors'] as int,
      nurses: json['nurses'] as int,
      labTechnicians: json['lab_technicians'] as int,
      admins: json['admins'] as int,
    );

Map<String, dynamic> _$$_StatsToJson(_$_Stats instance) => <String, dynamic>{
      'patient': instance.patient,
      'employees': instance.employees,
      'rooms': instance.rooms,
      'doctors': instance.doctors,
      'nurses': instance.nurses,
      'lab_technicians': instance.labTechnicians,
      'admins': instance.admins,
    };
