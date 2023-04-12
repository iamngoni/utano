//
//  user_role_to_screens_mappings
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';

import '../../admin/views/pages/admin_dashboard.dart';
import '../../admin/views/pages/admin_employees_page.dart';
import '../../admin/views/pages/admin_register_employee.dart';
import '../../nurse/views/pages/nurse_dashboard.dart';
import '../../nurse/views/pages/nurse_patients.dart';
import '../../nurse/views/pages/nurse_prescriptions.dart';
import '../../system_admin/views/pages/system_admin_dashboard.dart';
import '../../system_admin/views/pages/system_admin_health_institution_employees.dart';
import '../../system_admin/views/pages/system_admin_health_institutions.dart';
import '../../system_admin/views/pages/system_admin_health_institutions_admins.dart';
import '../models/data/user_role.dart';
import '../views/pages/change_password.dart';
import '../views/pages/point_of_service.dart';

final Map<UserRole, List<Widget>> userRoleToScreensMappings = {
  UserRole.nurse: [
    const NurseDashboardPage(),
    PointOfServicePage(),
    const NursePatientsPage(),
    const NursePrescriptionsPage(),
    ChangePasswordPage(),
  ],
  UserRole.systemAdmin: [
    const SystemAdminDashboardPage(),
    const SystemAdminHealthInstitutionsPage(),
    const SystemAdminHealthInstitutionsAdminsPage(),
    ChangePasswordPage(),
    // ====== Pages Not Displayed On The Sidebar
    SystemAdminHealthInstitutionEmployeesPage(),
  ],
  UserRole.admin: [
    const AdminDashboardPage(),
    const AdminEmployeesPage(),
    const AdminRegisterEmployeePage(),
    ChangePasswordPage(),
  ],
};
