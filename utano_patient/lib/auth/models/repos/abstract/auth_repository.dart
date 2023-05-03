//
//  auth_repository
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 3/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';

import '../../../../core/models/data/app_exception.dart';
import '../../../../core/models/data/auth_response.dart';
import '../../../../core/models/data/employment_status.dart';
import '../../../../core/models/data/gender.dart';
import '../../../../core/models/data/marital_status.dart';

abstract class AuthRepository {
  Future<Either<AppException, AuthResponse>> login(
      String email, String password);

  Future<Either<AppException, AuthResponse>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String mobileNumber,
    required Gender gender,
    required DateTime dateOfBirth,
    required MaritalStatus maritalStatus,
    required String nationalIdNumber,
    required String address,
    required EmploymentStatus employmentStatus,
    required String password,
    required String passwordConfirmation,
  });
}
