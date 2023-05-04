//
//  providers
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 3/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/blocs/connectivity/connectivity_bloc.dart';
import 'auth/blocs/auth/auth_bloc.dart';
import 'auth/blocs/sign_up/sign_up_bloc.dart';
import 'auth/models/repos/impl/dio_auth_repository.dart';
import 'core/services/di.dart';
import 'utano/blocs/check_in/check_in_bloc.dart';
import 'utano/blocs/health_institutions/health_institutions_bloc.dart';
import 'utano/blocs/prescriptions/prescriptions_bloc.dart';
import 'utano/models/repos/impl/dio_system_repository.dart';

final Dio dio = di<Dio>();

List<BlocProvider> providers = [
  BlocProvider<ConnectivityBloc>(
    create: (_) => ConnectivityBloc(),
  ),
  BlocProvider<AuthBloc>(
    create: (_) => AuthBloc(
      repository: DioAuthRepository(dio: dio),
    ),
  ),
  BlocProvider<SignUpBloc>(
    create: (_) => SignUpBloc(
      repository: DioAuthRepository(dio: dio),
    ),
  ),
  BlocProvider<PrescriptionsBloc>(
    create: (_) => PrescriptionsBloc(
      repository: DioSystemRepository(dio: dio),
    )..add(ListPrescriptions()),
  ),
  BlocProvider<CheckInBloc>(
    create: (_) => CheckInBloc(
      repository: DioSystemRepository(dio: dio),
    )..add(ListCheckIns()),
  ),
  BlocProvider<HealthInstitutionsBloc>(
    create: (_) => HealthInstitutionsBloc(
      repository: DioSystemRepository(dio: dio),
    )..add(ListHealthInstitutions()),
  ),
];
