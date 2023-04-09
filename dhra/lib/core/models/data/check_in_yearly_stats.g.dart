// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_yearly_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckInYearlyStats _$$_CheckInYearlyStatsFromJson(
        Map<String, dynamic> json) =>
    _$_CheckInYearlyStats(
      day: DateTime.parse(json['day'] as String),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_CheckInYearlyStatsToJson(
        _$_CheckInYearlyStats instance) =>
    <String, dynamic>{
      'day': instance.day.toIso8601String(),
      'count': instance.count,
    };
