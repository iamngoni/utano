//
//  check_in_monthly_stats
//  dhra
//
//  Created by Ngonidzashe Mangudya on 9/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_monthly_stats.freezed.dart';
part 'check_in_monthly_stats.g.dart';

@freezed
class CheckInMonthlyStats with _$CheckInMonthlyStats {
  factory CheckInMonthlyStats({
    required DateTime day,
    required int count,
  }) = _CheckInMonthlyStats;

  factory CheckInMonthlyStats.fromJson(Map<String, dynamic> json) =>
      _$CheckInMonthlyStatsFromJson(json);
}
