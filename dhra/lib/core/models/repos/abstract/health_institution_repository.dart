//
//  health_institution_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';

import '../../data/application_error.dart';
import '../../data/employee.dart';
import '../../data/gender.dart';
import '../../data/health_institution.dart';
import '../../data/stats.dart';
import '../../data/user_role.dart';

abstract class HealthInstitutionRepository {
  Future<Either<ApplicationError, List<Employee>>> listEmployees();
  Future<Either<ApplicationError, void>> createEmployee({
    required String firstName,
    required String lastName,
    required String email,
    required UserRole role,
    required Gender gender,
  });
  Future<Either<ApplicationError, HealthInstitution>> getInstitutionDetails();
  Future<Either<ApplicationError, Stats>> getInstitutionStats();
}
