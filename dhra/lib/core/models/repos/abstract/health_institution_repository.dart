//
//  health_institution_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';

import '../../data/application_error.dart';
import '../../data/stats.dart';

abstract class HealthInstitutionRepository {
  Future<Either<ApplicationError, Stats>> getHealthInstitutionStats();
}
