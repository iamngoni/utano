//
//  providers
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'admin/blocs/employee_registration/employee_registration_bloc.dart';
import 'admin/blocs/employees/employees_bloc.dart';
import 'core/blocs/change_password/change_password_bloc.dart';
import 'core/blocs/check_in_stats/check_in_stats_bloc.dart';
import 'core/blocs/health_institution_stats/health_institution_stats_bloc.dart';
import 'core/blocs/system_configs/system_configs_bloc.dart';
import 'core/models/repos/impl/dio_health_institution_repository.dart';
import 'core/models/repos/impl/dio_system_configs_repository.dart';
import 'core/services/di.dart';
import 'general/blocs/auth/auth_bloc.dart';
import 'general/models/repos/impl/dio_auth_repository.dart';
import 'system_admin/blocs/admin_registration/admin_registration_bloc.dart';
import 'system_admin/blocs/health_institution_employees/health_institution_employees_bloc.dart';
import 'system_admin/blocs/health_institutions/health_institutions_bloc.dart';
import 'system_admin/blocs/system_stats/system_stats_bloc.dart';
import 'system_admin/models/repos/impl/dio_system_admin_repository.dart';

final Dio dio = di<Dio>();

List<BlocProvider> providers = [
  BlocProvider<SystemConfigsBloc>(
    create: (_) =>
        SystemConfigsBloc(repository: DioSystemConfigsRepository(dio))
          ..add(
            LoadSystemConfigs(),
          ),
  ),
  BlocProvider<AuthBloc>(
    create: (_) => AuthBloc(
      repository: DioAuthRepository(dio),
    ),
  ),
  BlocProvider<ChangePasswordBloc>(
    create: (_) => ChangePasswordBloc(
      repository: DioAuthRepository(dio),
    ),
  ),
  BlocProvider<HealthInstitutionsBloc>(
    create: (_) => HealthInstitutionsBloc(
      repository: DioSystemAdminRepository(dio),
    ),
  ),
  BlocProvider<EmployeesBloc>(
    create: (_) => EmployeesBloc(
      repository: DioHealthInstitutionRepository(dio),
    ),
  ),
  BlocProvider<EmployeeRegistrationBloc>(
    create: (_) => EmployeeRegistrationBloc(
      repository: DioHealthInstitutionRepository(dio),
    ),
  ),
  BlocProvider<SystemStatsBloc>(
    create: (_) => SystemStatsBloc(
      repository: DioSystemAdminRepository(dio),
    ),
  ),
  BlocProvider<AdminRegistrationBloc>(
    create: (_) => AdminRegistrationBloc(
      repository: DioSystemAdminRepository(dio),
    ),
  ),
  BlocProvider<HealthInstitutionStatsBloc>(
    create: (_) => HealthInstitutionStatsBloc(
      repository: DioHealthInstitutionRepository(dio),
    ),
  ),
  BlocProvider<HealthInstitutionEmployeesBloc>(
    create: (_) => HealthInstitutionEmployeesBloc(
      repository: DioSystemAdminRepository(dio),
    ),
  ),
  BlocProvider<CheckInStatsBloc>(
    create: (_) => CheckInStatsBloc(
      repository: DioHealthInstitutionRepository(dio),
    ),
  ),
];
