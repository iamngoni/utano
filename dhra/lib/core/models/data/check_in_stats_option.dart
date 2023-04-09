//
//  check_in_stats_option
//  dhra
//
//  Created by Ngonidzashe Mangudya on 9/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

enum CheckInStatsOption {
  monthly('MONTHLY'),
  yearly('YEARLY');

  const CheckInStatsOption(this.value);
  final String value;

  @override
  String toString() => value;
}
