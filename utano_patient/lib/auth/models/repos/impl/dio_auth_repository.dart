//
//  dio_auth_repository
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 4/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/functions/dio_error_to_app_exception.dart';
import '../../../../core/models/data/marital_status.dart';
import '../../../../core/models/data/gender.dart';
import '../../../../core/models/data/employment_status.dart';
import '../../../../core/models/data/auth_response.dart';
import '../../../../core/models/data/app_exception.dart';
import '../../../../core/models/data/network_response.dart';
import '../abstract/auth_repository.dart';

class DioAuthRepository implements AuthRepository {
  DioAuthRepository({required this.dio});

  @override
  Future<Either<AppException, AuthResponse>> login(
    String email,
    String password,
  ) async {
    try {
      final Response<NetworkResponse> response = await dio.post(
        '/auth/signin',
        data: {
          'username': email,
          'password': password,
        },
      );
      final NetworkResponse networkResponse = response.data!;
      final AuthResponse authResponse = AuthResponse.fromJson(
        networkResponse.data!,
      );
      return Right(authResponse);
    } on DioError catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(dioErrorToAppException(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(AppException.unknown());
    }
  }

  @override
  Future<Either<AppException, AuthResponse>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String mobileNumber,
      required Gender gender,
      required DateTime dateOfBirth,
      required MaritalStatus maritalStatus,
      required String nationalIdNumber,
      required String address,
      required EmploymentStatus employmentStatus,
      required String password,
      required String passwordConfirmation}) async {
    try {
      final Response<NetworkResponse> response = await dio.post(
        '/auth/preregistration',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'mobile_number': mobileNumber,
          'gender': gender.value,
          // yyyy-mm-dd
          'date_of_birth': dateOfBirth.toIso8601String().split('T')[0],
          'marital_status': maritalStatus.value,
          'national_id_number': nationalIdNumber,
          'address': address,
          'employment_status': employmentStatus.value,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      final NetworkResponse networkResponse = response.data!;
      final AuthResponse authResponse = AuthResponse.fromJson(
        networkResponse.data!,
      );
      return Right(authResponse);
    } on DioError catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(dioErrorToAppException(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(AppException.unknown());
    }
  }

  final Dio dio;
}
