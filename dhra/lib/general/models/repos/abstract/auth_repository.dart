//
//  auth_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';

import '../../../../core/models/data/application_error.dart';
import '../../../../core/models/data/auth_response.dart';

abstract class AuthRepository {
  Future<Either<ApplicationError, AuthResponse>> login(
    String email,
    String password,
  );
  Future<Either<ApplicationError, AuthResponse>> refreshAuthToken(String token);
  Future<Either<ApplicationError, void>> updatePassword({
    required String oldPassword,
    required String password,
    required String passwordConfirmation,
  });
}
