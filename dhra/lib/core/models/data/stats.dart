//
//  stats
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@freezed
class Stats with _$Stats {
  factory Stats({
    required int patients,
    required int employees,
    required int rooms,
    required int doctors,
    required int nurses,
    @JsonKey(name: 'lab_technicians') required int labTechnicians,
    required int admins,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
