// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_monthly_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckInMonthlyStats _$$_CheckInMonthlyStatsFromJson(
        Map<String, dynamic> json) =>
    _$_CheckInMonthlyStats(
      day: DateTime.parse(json['day'] as String),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_CheckInMonthlyStatsToJson(
        _$_CheckInMonthlyStats instance) =>
    <String, dynamic>{
      'day': instance.day.toIso8601String(),
      'count': instance.count,
    };
