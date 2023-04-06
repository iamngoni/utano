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
import '../../data/network_response.dart';
import '../../data/stats.dart';
import '../abstract/health_institution_repository.dart';

class DioHealthInstitutionRepository extends HealthInstitutionRepository {
  DioHealthInstitutionRepository(this.dio);
  @override
  Future<Either<ApplicationError, Stats>> getHealthInstitutionStats() async {
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

  final Dio dio;
}
