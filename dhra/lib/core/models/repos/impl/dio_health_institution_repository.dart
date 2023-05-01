//
//  dio_health_institution_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:localregex/localregex.dart';

import '../../../../pharmacist/models/data/dispense_drug.dart';
import '../../../../pharmacist/models/data/drug.dart';
import '../../../configs/logger.dart';
import '../../../utils/dio_error_to_application_error.dart';
import '../../data/application_error.dart';
import '../../data/approved_medicine.dart';
import '../../data/check_in.dart';
import '../../data/check_in_monthly_stats.dart';
import '../../data/check_in_yearly_stats.dart';
import '../../data/dispense.dart';
import '../../data/employee.dart';
import '../../data/gender.dart';
import '../../data/health_institution.dart';
import '../../data/network_response.dart';
import '../../data/patient.dart';
import '../../data/payment.dart';
import '../../data/payment_method.dart';
import '../../data/pos_prescription_item.dart';
import '../../data/prescription.dart';
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

  @override
  Future<Either<ApplicationError, Patient>> getPatientDetails(String id) async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/health_institution/patients/$id');
      final NetworkResponse networkResponse = response.data!;
      final Patient patient = Patient.fromJson(
        networkResponse.data!['patient'] as Map<String, dynamic>,
      );
      return Right(patient);
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
  Future<Either<ApplicationError, List<Patient>>> getPatients() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/health_institution/patients');
      final NetworkResponse networkResponse = response.data!;
      final List<Patient> patients = (networkResponse.data!['patients'] as List)
          .map(
            (patient) => Patient.fromJson(patient as Map<String, dynamic>),
          )
          .toList();
      return Right(patients);
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
  Future<Either<ApplicationError, CheckIn>> checkInPatient({
    required String firstName,
    required String lastName,
    required String mobileNumber,
    required String gender,
    required double temperature,
    required double systolicBloodPressure,
    required double diastolicBloodPressure,
    required double pulse,
    required double respiratoryRate,
    required String patientNotes,
    required String examinationNotes,
    required String diagnosisNotes,
    required String treatmentNotes,
    String? address,
    int? age,
    DateTime? dateOfBirth,
  }) async {
    final Map<String, dynamic> checkInData = {
      'first_name': firstName,
      'last_name': lastName,
      'address': address,
      'mobile_number': mobileNumber,
      'gender': gender,
      'temperature': temperature,
      'systolic_blood_pressure': systolicBloodPressure,
      'diastolic_blood_pressure': diastolicBloodPressure,
      'pulse': pulse,
      'respiratory_rate': respiratoryRate,
      'patient_notes': patientNotes,
      'examination_notes': examinationNotes,
      'diagnosis_notes': diagnosisNotes,
      'treatment_notes': treatmentNotes,
    };

    if (dateOfBirth != null) {
      // use YYYY-MM-DD format
      checkInData['date_of_birth'] =
          dateOfBirth.toIso8601String().split('T')[0];
    } else {
      checkInData['age'] = age;
    }

    try {
      final Response<NetworkResponse> response = await dio.post(
        '/pos/check-in',
        data: checkInData,
      );

      final NetworkResponse networkResponse = response.data!;
      final CheckIn checkIn = CheckIn.fromJson(
        networkResponse.data!['check_in'] as Map<String, dynamic>,
      );
      return Right(checkIn);
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
  Future<Either<ApplicationError, List<Drug>>> listDrugs() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/pharmacy/drugs');
      final NetworkResponse networkResponse = response.data!;
      final List<Drug> drugs = (networkResponse.data!['drugs'] as List)
          .map((drug) => Drug.fromJson(drug as Map<String, dynamic>))
          .toList();
      return Right(drugs);
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
  Future<Either<ApplicationError, List<ApprovedMedicine>>>
      listApprovedMedicines() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/pharmacy/approved_medicines');
      final NetworkResponse networkResponse = response.data!;
      final List<ApprovedMedicine> approvedMedicines =
          (networkResponse.data!['approved_medicines'] as List)
              .map(
                (medicine) =>
                    ApprovedMedicine.fromJson(medicine as Map<String, dynamic>),
              )
              .toList();
      return Right(approvedMedicines);
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
  Future<Either<ApplicationError, Prescription>> prescribeMedicationToPatient({
    required CheckIn checkIn,
    required List<PosPrescriptionItem> prescriptionItems,
  }) async {
    final Map<String, dynamic> prescriptionData = {
      'prescription_items': prescriptionItems
          .map(
            (e) => {
              'medicine': e.medicine.id,
              'frequency': 3,
              'quantity': e.count,
              // TODO(iamngoni): fix this section
              'instructions': 'Eat this'
            },
          )
          .toList(),
    };

    try {
      final Response<NetworkResponse> response = await dio.post(
        '/pos/check-in/${checkIn.id}',
        data: prescriptionData,
      );

      final NetworkResponse networkResponse = response.data!;
      final Prescription prescription = Prescription.fromJson(
        networkResponse.data!['prescription'] as Map<String, dynamic>,
      );
      return Right(prescription);
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
  Future<Either<ApplicationError, List<Prescription>>>
      listPrescriptions() async {
    try {
      final Response<NetworkResponse> response =
          await dio.get('/health_institution/prescriptions');
      final NetworkResponse networkResponse = response.data!;
      final List<Prescription> prescriptions =
          (networkResponse.data!['prescriptions'] as List)
              .map(
                (prescription) =>
                    Prescription.fromJson(prescription as Map<String, dynamic>),
              )
              .toList();
      return Right(prescriptions);
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
  Future<Either<ApplicationError, Prescription>> getPrescription(
    String prescriptionNumber,
  ) async {
    try {
      final Response<NetworkResponse> response = await dio
          .get('/health_institution/prescriptions/$prescriptionNumber');
      final NetworkResponse networkResponse = response.data!;
      final Prescription prescription = Prescription.fromJson(
        networkResponse.data!['prescription'] as Map<String, dynamic>,
      );
      return Right(prescription);
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
  Future<Either<ApplicationError, Dispense>> processPrescription(
    Prescription prescription,
    List<DispenseDrug> dispensedDrugs,
  ) async {
    try {
      final Map<String, dynamic> data = {
        'prescription_id': prescription.id,
        'items': dispensedDrugs
            .map(
              (e) => {
                'drug_id': e.drug.id,
                'quantity': e.quantity,
              },
            )
            .toList(),
      };
      final Response<NetworkResponse> response = await dio.post(
        '/pharmacy/process_prescription',
        data: data,
      );

      final NetworkResponse networkResponse = response.data!;
      final Dispense dispense = Dispense.fromJson(
        networkResponse.data!['dispense'] as Map<String, dynamic>,
      );
      return Right(dispense);
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
  Future<Either<ApplicationError, Payment>> dispensaryPayment(
    Dispense dispense,
    PaymentMethod paymentMethod,
    String? mobileNumber,
  ) async {
    try {
      final Map<String, dynamic> data = {
        'dispense': dispense.id,
        'payment_method': paymentMethod.name.toLowerCase(),
      };

      if ([PaymentMethod.ecocash, PaymentMethod.onemoney]
          .contains(paymentMethod)) {
        if (mobileNumber == null) {
          return Left(ApplicationError('Specify payment mobile number'));
        }

        data['phone'] =
            mobileNumber.formatNumber(formatType: FormatType.regular);
      }

      final Response<NetworkResponse> response = await dio.post(
        '/payments/dispensary',
        data: data,
      );

      final NetworkResponse networkResponse = response.data!;
      final Payment payment = Payment.fromJson(
        networkResponse.data!['payment'] as Map<String, dynamic>,
      );
      return Right(payment);
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
