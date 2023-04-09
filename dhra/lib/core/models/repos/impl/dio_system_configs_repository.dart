//
//  dio_system_configs_repository
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
import '../../data/district.dart';
import '../../data/employment_status.dart';
import '../../data/gender.dart';
import '../../data/marital_status.dart';
import '../../data/network_response.dart';
import '../../data/province.dart';
import '../../data/relationship_type.dart';
import '../abstract/system_configs_repository.dart';

class DioSystemConfigsRepository extends SystemConfigsRepository {
  DioSystemConfigsRepository(this.dio);

  @override
  Future<Either<ApplicationError, List<District>>> getDistricts() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/system/districts');
      final NetworkResponse networkResponse = response.data!;
      final List<District> districts = (networkResponse.data!['districts']
              as List)
          .map<District>((i) => District.fromJson(i as Map<String, dynamic>))
          .toList();
      return Right(districts);
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
  Future<Either<ApplicationError, List<EmploymentStatus>>>
      getEmploymentStatuses() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/system/employment_statuses');
      final NetworkResponse networkResponse = response.data!;
      final List<EmploymentStatus> statuses =
          (networkResponse.data!['statuses'] as List)
              .map<EmploymentStatus>(
                (i) => EmploymentStatus.fromJson(i as Map<String, dynamic>),
              )
              .toList();
      return Right(statuses);
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
  Future<Either<ApplicationError, List<Gender>>> getGender() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/system/genders');
      final NetworkResponse networkResponse = response.data!;
      final List<Gender> genders = (networkResponse.data!['genders'] as List)
          .map<Gender>((i) => Gender.fromJson(i as Map<String, dynamic>))
          .toList();
      return Right(genders);
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
  Future<Either<ApplicationError, List<MaritalStatus>>>
      getMaritalStatuses() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/system/marital_statuses');
      final NetworkResponse networkResponse = response.data!;
      final List<MaritalStatus> statuses =
          (networkResponse.data!['statuses'] as List)
              .map<MaritalStatus>(
                (i) => MaritalStatus.fromJson(i as Map<String, dynamic>),
              )
              .toList();
      return Right(statuses);
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
  Future<Either<ApplicationError, List<Province>>> getProvinces() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/system/provinces');
      final NetworkResponse networkResponse = response.data!;
      final List<Province> provinces = (networkResponse.data!['provinces']
              as List)
          .map<Province>((i) => Province.fromJson(i as Map<String, dynamic>))
          .toList();
      return Right(provinces);
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
  Future<Either<ApplicationError, List<RelationshipType>>>
      getRelationshipTypes() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/system/relationship_types');
      final NetworkResponse networkResponse = response.data!;
      final List<RelationshipType> types =
          (networkResponse.data!['types'] as List)
              .map<RelationshipType>(
                (i) => RelationshipType.fromJson(i as Map<String, dynamic>),
              )
              .toList();
      return Right(types);
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
