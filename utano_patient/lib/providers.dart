//
//  providers
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 3/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/blocs/connectivity/connectivity_bloc.dart';

List<BlocProvider> providers = [
  BlocProvider<ConnectivityBloc>(
    create: (_) => ConnectivityBloc(),
  ),
];
