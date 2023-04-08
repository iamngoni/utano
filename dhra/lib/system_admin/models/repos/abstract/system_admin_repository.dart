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
import '../../../../core/models/data/gender.dart';
import '../../../../core/models/data/health_institution.dart';
import '../../data/system_stats.dart';

abstract class SystemAdminRepository {
  Future<Either<ApplicationError, List<HealthInstitution>>>
      listHealthInstitutions();
  Future<Either<ApplicationError, HealthInstitution>>
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
  Future<Either<ApplicationError, SystemStats>> getSystemStats();
  Future<Either<ApplicationError, Employee>> registerHealthInstitutionAdmin({
    required String healthInstitutionId,
    required String firstName,
    required String lastName,
    required String email,
    required Gender gender,
  });
}
