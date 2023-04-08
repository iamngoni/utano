//
//  user_role
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

enum UserRole {
  @JsonValue('PATIENT')
  patient('PATIENT'),
  @JsonValue('DOCTOR')
  doctor('DOCTOR'),
  @JsonValue('SYSTEM_ADMIN')
  systemAdmin('SYSTEM_ADMIN'),
  @JsonValue('ADMIN')
  admin('ADMIN'),
  @JsonValue('NURSE')
  nurse('NURSE'),
  @JsonValue('LAB_TECHNICIAN')
  labTechnician('LAB_TECHNICIAN'),
  @JsonValue('PHARMACIST')
  pharmacist('PHARMACIST');

  const UserRole(this.value);
  final String value;

  @override
  String toString() => value;
}
