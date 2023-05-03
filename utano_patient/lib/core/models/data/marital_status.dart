//
//  marital_status
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 3/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

enum MaritalStatus {
  @JsonValue('SINGLE')
  single('SINGLE'),
  @JsonValue('MARRIED')
  married('MARRIED'),
  @JsonValue('DIVORCED')
  divorced('DIVORCED'),
  @JsonValue('WIDOWED')
  widowed('WIDOWED'),
  @JsonValue('SEPARATED')
  separated('SEPARATED');

  const MaritalStatus(this.value);
  final String value;
}
