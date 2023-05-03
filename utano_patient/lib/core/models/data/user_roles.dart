//
//  user_roles
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 3/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

enum UserRoles {
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
  @JsonValue('HEALTH_INSTITUTION')
  healthInstitution('HEALTH_INSTITUTION'),
  @JsonValue('LAB_TECHNICIAN')
  labTechnician('LAB_TECHNICIAN'),
  @JsonValue('PHARMACIST')
  pharmacist('PHARMACIST');

  const UserRoles(this.role);
  final String role;
}
