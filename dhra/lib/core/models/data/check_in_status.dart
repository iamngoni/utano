//
//  check_in_status
//  dhra
//
//  Created by Ngonidzashe Mangudya on 12/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

enum CheckInStatus {
  @JsonValue('ADMITTED')
  admitted('ADMITTED'),
  @JsonValue('DISMISSED')
  dismissed('DISMISSED'),
  @JsonValue('CHECKED_IN')
  checkedIn('CHECKED_IN');

  const CheckInStatus(this.status);
  final String status;
}
