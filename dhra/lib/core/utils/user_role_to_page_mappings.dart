//
//  user_role_to_page_mappings
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/widgets.dart';

import '../../admin/views/pages/admin_app.dart';
import '../../doctor/views/pages/doctor_home.dart';
import '../../lab_technician/views/pages/lab_technician_home.dart';
import '../../nurse/views/pages/nurse_app.dart';
import '../../pharmacist/views/pages/pharmacist_app.dart';
import '../../system_admin/views/pages/system_admin_app.dart';
import '../models/data/user_role.dart';

final Map<UserRole, Widget> userRoleToPageMappings = {
  UserRole.admin: const AdminApp(),
  UserRole.doctor: const DoctorHomePage(),
  UserRole.nurse: const NurseApp(),
  UserRole.labTechnician: const LabTechnicianHomePage(),
  UserRole.pharmacist: const PharmacistApp(),
  UserRole.systemAdmin: const SystemAdminApp(),
};
