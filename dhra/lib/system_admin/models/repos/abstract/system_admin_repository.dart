//
//  system_admin_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/models/data/application_error.dart';
import '../../../../core/models/data/employee.dart';
import '../../../../core/models/data/health_institution.dart';

abstract class SystemAdminRepository {
  Future<Either<ApplicationError, List<HealthInstitution<String>>>>
      listHealthInstitutions();
  Future<Either<ApplicationError, HealthInstitution<String>>>
      registerHealthInstitution({
    required String name,
    required String address,
    required String phoneNumber,
    required String email,
    required File logo,
    required String district,
  });
  Future<Either<ApplicationError, List<Employee>>> listHealthInstitutionAdmins(
    String healthInstitutionId,
  );
  Future<Either<ApplicationError, List<Employee>>>
      listHealthInstitutionEmployees(
    String healthInstitutionId,
  );
}
