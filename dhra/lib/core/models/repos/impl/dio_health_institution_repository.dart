//
//  dio_health_institution_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../configs/logger.dart';
import '../../../utils/dio_error_to_application_error.dart';
import '../../data/application_error.dart';
import '../../data/check_in_monthly_stats.dart';
import '../../data/check_in_yearly_stats.dart';
import '../../data/employee.dart';
import '../../data/gender.dart';
import '../../data/health_institution.dart';
import '../../data/network_response.dart';
import '../../data/stats.dart';
import '../../data/user_role.dart';
import '../abstract/health_institution_repository.dart';

class DioHealthInstitutionRepository extends HealthInstitutionRepository {
  DioHealthInstitutionRepository(this.dio);
  @override
  Future<Either<ApplicationError, Stats>> getInstitutionStats() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/health_institution/statistics');
      final NetworkResponse networkResponse = response.data!;
      final Stats stats = Stats.fromJson(networkResponse.data!);
      return Right(stats);
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
  Future<Either<ApplicationError, bool>> createEmployee({
    required String firstName,
    required String lastName,
    required String email,
    required UserRole role,
    required Gender gender,
  }) async {
    try {
      final Response<NetworkResponse> response = await dio.post(
        '/health_institution/employees',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'role': role.value,
          'gender': gender.value,
        },
      );
      return const Right(true);
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
      getInstitutionDetails() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/health_institution/details');
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
  Future<Either<ApplicationError, List<Employee>>> listEmployees() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/health_institution/employees');
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
  Future<Either<ApplicationError, List<CheckInMonthlyStats>>>
      getMonthlyCheckInStats() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/health_institution/checkin_statistics?period=month');
      final NetworkResponse networkResponse = response.data!;
      final List<CheckInMonthlyStats> stats =
          (networkResponse.data!['statistics'] as List)
              .map(
                (stat) =>
                    CheckInMonthlyStats.fromJson(stat as Map<String, dynamic>),
              )
              .toList()
            ..sort((a, b) => a.day.compareTo(b.day));
      return Right(stats);
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
  Future<Either<ApplicationError, List<CheckInYearlyStats>>>
      getYearlyCheckInStats() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/health_institution/checkin_statistics?period=year');
      final NetworkResponse networkResponse = response.data!;
      final List<CheckInYearlyStats> stats =
          (networkResponse.data!['statistics'] as List)
              .map(
                (stat) =>
                    CheckInYearlyStats.fromJson(stat as Map<String, dynamic>),
              )
              .toList()
            ..sort((a, b) => a.month.compareTo(b.month));

      return Right(stats);
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
