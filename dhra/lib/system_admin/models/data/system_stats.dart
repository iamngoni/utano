//
//  system_stats
//  dhra
//
//  Created by Ngonidzashe Mangudya on 8/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_stats.freezed.dart';
part 'system_stats.g.dart';

@freezed
class SystemStats with _$SystemStats {
  factory SystemStats({
    @JsonKey(name: 'health_institutions') required int healthInstitutions,
    required int employees,
    required int patients,
  }) = _SystemStats;

  factory SystemStats.fromJson(Map<String, dynamic> json) =>
      _$SystemStatsFromJson(json);
}
