//
//  check_in_yearly_stats
//  dhra
//
//  Created by Ngonidzashe Mangudya on 9/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_yearly_stats.freezed.dart';
part 'check_in_yearly_stats.g.dart';

@freezed
class CheckInYearlyStats with _$CheckInYearlyStats {
  factory CheckInYearlyStats({
    required DateTime month,
    required int count,
  }) = _CheckInYearlyStats;

  factory CheckInYearlyStats.fromJson(Map<String, dynamic> json) =>
      _$CheckInYearlyStatsFromJson(json);
}
