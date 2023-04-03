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
import '../../../../core/models/application_error.dart';
import '../../../../core/models/auth_response.dart';
import '../../../../core/models/network_response.dart';
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
      return Left(dioErrorToApplicationError(e));
    } catch (e) {
      logger.error(e);
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
    } catch (e) {
      logger.error(e);
      return Left(ApplicationError.unknownError());
    }
  }

  final Dio dio;
}
