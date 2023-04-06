//
//  dio_system_admin_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/configs/configs.dart';
import '../../../../core/models/data/application_error.dart';
import '../../../../core/models/data/employee.dart';
import '../../../../core/models/data/health_institution.dart';
import '../../../../core/models/data/network_response.dart';
import '../../../../core/utils/dio_error_to_application_error.dart';
import '../abstract/system_admin_repository.dart';

class DioSystemAdminRepository implements SystemAdminRepository {
  DioSystemAdminRepository(this.dio);

  @override
  Future<Either<ApplicationError, List<Employee>>> listHealthInstitutionAdmins(
    String healthInstitutionId,
  ) {
    // TODO: implement listHealthInstitutionAdmins
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, List<Employee>>>
      listHealthInstitutionEmployees(String healthInstitutionId) {
    // TODO: implement listHealthInstitutionEmployees
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, List<HealthInstitution<String>>>>
      listHealthInstitutions() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/staff/health_institutions');
      final NetworkResponse networkResponse = response.data!;

      final List<HealthInstitution<String>> healthInstitutions =
          (networkResponse.data!['health_institutions'] as List)
              .map(
                (e) => HealthInstitution<String>.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
      return Right(healthInstitutions);
    } on DioError catch (e) {
      return Left(dioErrorToApplicationError(e));
    } catch (e, s) {
      logger
        ..e(e)
        ..e(s);
      return Left(ApplicationError.unknownError());
    }
  }

  @override
  Future<Either<ApplicationError, HealthInstitution<String>>>
      registerHealthInstitution({
    required String name,
    required String address,
    required String phoneNumber,
    required String email,
    required File logo,
    required String district,
  }) {
    // TODO: implement registerHealthInstitution
    throw UnimplementedError();
  }

  final Dio dio;
}
