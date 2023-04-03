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
  patient,
  @JsonValue('DOCTOR')
  doctor,
  @JsonValue('SYSTEM_ADMIN')
  systemAdmin,
  @JsonValue('ADMIN')
  admin,
  @JsonValue('NURSE')
  nurse,
  @JsonValue('HEALTH_INSTITUTION')
  healthInstitution,
  @JsonValue('LAB_TECHNICIAN')
  labTechnician,
  @JsonValue('PHARMACIST')
  pharmacist,
}
