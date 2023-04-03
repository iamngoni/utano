//
//  user_role_to_page_mappings
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/widgets.dart';

import '../../admin/views/pages/admin_home.dart';
import '../../doctor/views/pages/doctor_home.dart';
import '../../health_institution/views/pages/health_institution_home.dart';
import '../../lab_technician/views/pages/lab_technician_home.dart';
import '../../nurse/views/pages/nurse_app.dart';
import '../../pharmacist/views/pages/pharmacist_home.dart';
import '../../system_admin/views/pages/system_admin_home.dart';
import '../models/user_role.dart';

final Map<UserRole, Widget> userRoleToPageMappings = {
  UserRole.admin: const AdminHomePage(),
  UserRole.doctor: const DoctorHomePage(),
  UserRole.nurse: const NurseApp(),
  UserRole.healthInstitution: const HealthInstitutionHomePage(),
  UserRole.labTechnician: const LabTechnicianHomePage(),
  UserRole.pharmacist: const PharmacistHomePage(),
  UserRole.systemAdmin: const SystemAdminHomePage(),
};
