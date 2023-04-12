//
//  system_configs_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';

import '../../data/application_error.dart';
import '../../data/district.dart';
import '../../data/employment_status.dart';
import '../../data/gender.dart';
import '../../data/marital_status.dart';
import '../../data/province.dart';
import '../../data/relationship_type.dart';

abstract class SystemConfigsRepository {
  Future<Either<ApplicationError, List<Province>>> getProvinces();
  Future<Either<ApplicationError, List<District>>> getDistricts();
  Future<Either<ApplicationError, List<Gender>>> getGender();
  Future<Either<ApplicationError, List<MaritalStatus>>> getMaritalStatuses();
  Future<Either<ApplicationError, List<EmploymentStatus>>>
      getEmploymentStatuses();
  Future<Either<ApplicationError, List<RelationshipType>>>
      getRelationshipTypes();
}
