//
//  system_repository
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 4/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';

import '../../../../core/models/data/app_exception.dart';
import '../../data/check_in.dart';
import '../../data/health_institution.dart';
import '../../data/prescription.dart';

abstract class SystemRepository {
  Future<Either<AppException, List<HealthInstitution>>> getHealthInstitutions();
  Future<Either<AppException, List<CheckIn>>> getCheckIns();
  Future<Either<AppException, List<Prescription>>> getPrescriptions();
}
