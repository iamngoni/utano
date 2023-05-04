import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/functions/functions.dart';
import '../../../../core/models/data/network_response.dart';
import '../../data/prescription.dart';
import '../../data/health_institution.dart';
import '../../data/check_in.dart';
import '../../../../core/models/data/app_exception.dart';
import '../abstract/system_repository.dart';

class DioSystemRepository implements SystemRepository {
  DioSystemRepository({required this.dio});

  final Dio dio;

  @override
  Future<Either<AppException, List<CheckIn>>> getCheckIns() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/patient/checkins');
      final NetworkResponse networkResponse = response.data!;
      final List<CheckIn> checkIns =
          (networkResponse.data!['patient_checkins'] as List<dynamic>)
              .map<CheckIn>(
                  (dynamic e) => CheckIn.fromJson(e as Map<String, dynamic>))
              .toList();
      return Right(checkIns);
    } on DioError catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(dioErrorToAppException(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(AppException.unknown());
    }
  }

  @override
  Future<Either<AppException, List<HealthInstitution>>>
      getHealthInstitutions() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/patient/health_institutions');
      final NetworkResponse networkResponse = response.data!;
      final List<HealthInstitution> healthInstitutions =
          (networkResponse.data!['health_institutions'] as List<dynamic>)
              .map<HealthInstitution>((dynamic e) =>
                  HealthInstitution.fromJson(e as Map<String, dynamic>))
              .toList();
      return Right(healthInstitutions);
    } on DioError catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(dioErrorToAppException(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(AppException.unknown());
    }
  }

  @override
  Future<Either<AppException, List<Prescription>>> getPrescriptions() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/patient/prescriptions');
      final NetworkResponse networkResponse = response.data!;
      final List<Prescription> prescriptions = (networkResponse
              .data!['prescriptions'] as List<dynamic>)
          .map<Prescription>(
              (dynamic e) => Prescription.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(prescriptions);
    } on DioError catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(dioErrorToAppException(e));
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Left(AppException.unknown());
    }
  }
}
