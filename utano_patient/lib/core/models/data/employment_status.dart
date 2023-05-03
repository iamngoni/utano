//
//  employment_status
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 3/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

enum EmploymentStatus {
  @JsonValue('EMPLOYEE')
  employee('EMPLOYEE'),
  @JsonValue('SELF_EMPLOYED')
  selfEmployed('SELF_EMPLOYED'),
  @JsonValue('CONTRACTOR')
  contractor('CONTRACTOR');

  const EmploymentStatus(this.value);
  final String value;
}
