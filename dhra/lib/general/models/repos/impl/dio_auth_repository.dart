//
//  dio_auth_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/configs/logger.dart';
import '../../../../core/models/data/application_error.dart';
import '../../../../core/models/data/auth_response.dart';
import '../../../../core/models/data/network_response.dart';
import '../../../../core/utils/dio_error_to_application_error.dart';
import '../abstract/auth_repository.dart';

class DioAuthRepository implements AuthRepository {
  DioAuthRepository(this.dio);
  @override
  Future<Either<ApplicationError, AuthResponse>> login(
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
    } on DioError catch (e) {
      logger.e(e);
      return Left(dioErrorToApplicationError(e));
    } catch (e, s) {
      logger
        ..e(e)
        ..e(s);
      return Left(ApplicationError.unknownError());
    }
  }

  @override
  Future<Either<ApplicationError, AuthResponse>> refreshAuthToken(
    String token,
  ) async {
    try {
      final Response<NetworkResponse> response = await dio.post(
        '/auth/refresh',
        data: {
          'refresh_token': token,
        },
      );
      final NetworkResponse networkResponse = response.data!;
      final AuthResponse authResponse = AuthResponse.fromJson(
        networkResponse.data!,
      );
      return Right(authResponse);
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
  Future<Either<ApplicationError, void>> updatePassword({
    required String oldPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final Response<NetworkResponse> response = await dio.put(
        '/auth/update_password',
        data: {
          'old_password': oldPassword,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      final NetworkResponse networkResponse = response.data!;
      return const Right(null);
    } on DioError catch (e) {
      return Left(dioErrorToApplicationError(e));
    } catch (e) {
      logger.error(e);
      return Left(ApplicationError.unknownError());
    }
  }

  final Dio dio;
}
