//
//  providers
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/blocs/system_configs/system_configs_bloc.dart';
import 'core/models/repos/impl/dio_system_configs_repository.dart';
import 'core/services/di.dart';
import 'general/blocs/auth/auth_bloc.dart';
import 'general/models/repos/impl/dio_auth_repository.dart';
import 'system_admin/blocs/health_institutions/health_institutions_bloc.dart';
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
  BlocProvider<HealthInstitutionsBloc>(
    create: (_) => HealthInstitutionsBloc(
      repository: DioSystemAdminRepository(dio),
    ),
  ),
];
