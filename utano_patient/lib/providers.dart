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
];
