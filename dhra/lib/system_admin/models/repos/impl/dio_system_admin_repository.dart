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
import '../../../../core/models/data/gender.dart';
import '../../../../core/models/data/health_institution.dart';
import '../../../../core/models/data/network_response.dart';
import '../../../../core/utils/dio_error_to_application_error.dart';
import '../../data/system_stats.dart';
import '../abstract/system_admin_repository.dart';

class DioSystemAdminRepository implements SystemAdminRepository {
  DioSystemAdminRepository(this.dio);

  @override
  Future<Either<ApplicationError, List<Employee>>> listHealthInstitutionAdmins(
    String healthInstitutionId,
  ) async {
    try {
      final Response<NetworkResponse> response = await dio
          .get('/staff/health_institutions/$healthInstitutionId/admins');
      final NetworkResponse networkResponse = response.data!;
      final List<Employee> employees =
          (networkResponse.data!['employees'] as List)
              .map(
                (employee) =>
                    Employee.fromJson(employee as Map<String, dynamic>),
              )
              .toList();
      return Right(employees);
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
  Future<Either<ApplicationError, List<Employee>>>
      listHealthInstitutionEmployees(String healthInstitutionId) async {
    try {
      final Response<NetworkResponse> response = await dio
          .get('/staff/health_institutions/$healthInstitutionId/employees');
      final NetworkResponse networkResponse = response.data!;
      final List<Employee> employees =
          (networkResponse.data!['employees'] as List)
              .map(
                (employee) =>
                    Employee.fromJson(employee as Map<String, dynamic>),
              )
              .toList();
      return Right(employees);
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
  Future<Either<ApplicationError, List<HealthInstitution>>>
      listHealthInstitutions() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/staff/health_institutions');
      final NetworkResponse networkResponse = response.data!;

      final List<HealthInstitution> healthInstitutions =
          (networkResponse.data!['health_institutions'] as List)
              .map(
                (e) => HealthInstitution.fromJson(
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
  Future<Either<ApplicationError, HealthInstitution>>
      registerHealthInstitution({
    required String name,
    required String address,
    required String phoneNumber,
    required String email,
    required File logo,
    required String district,
  }) async {
    try {
      final FormData formData = FormData.fromMap({
        'name': name,
        'address': address,
        'phone_number': phoneNumber,
        'email': email,
        'district': district,
        'logo': await MultipartFile.fromFile(
          logo.path,
          filename: logo.path.split('/').last,
        ),
      });

      final Response<NetworkResponse> response = await dio.post(
        '/staff/health_institutions',
        data: formData,
      );
      final NetworkResponse networkResponse = response.data!;
      final HealthInstitution healthInstitution = HealthInstitution.fromJson(
        networkResponse.data!['health_institution'] as Map<String, dynamic>,
      );
      return Right(healthInstitution);
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
  Future<Either<ApplicationError, SystemStats>> getSystemStats() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/staff/system_statistics');
      final NetworkResponse networkResponse = response.data!;
      final SystemStats systemStats =
          SystemStats.fromJson(networkResponse.data!);
      return Right(systemStats);
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
  Future<Either<ApplicationError, Employee>> registerHealthInstitutionAdmin({
    required String healthInstitutionId,
    required String firstName,
    required String lastName,
    required String email,
    required Gender gender,
  }) async {
    try {
      final Response<NetworkResponse> response = await dio.post(
        '/staff/health_institutions/$healthInstitutionId/admins',
        data: {
          'email': email,
          'gender': gender.value,
          'first_name': firstName,
          'last_name': lastName,
        },
      );
      final NetworkResponse networkResponse = response.data!;
      final Employee admin = Employee.fromJson(
        networkResponse.data!['admin'] as Map<String, dynamic>,
      );
      return Right(admin);
    } on DioError catch (e) {
      return Left(dioErrorToApplicationError(e));
    } catch (e, s) {
      logger
        ..e(e)
        ..e(s);
      return Left(ApplicationError.unknownError());
    }
  }

  final Dio dio;
}
