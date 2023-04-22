//
//  health_institution_repository
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';

import '../../data/application_error.dart';
import '../../data/check_in.dart';
import '../../data/check_in_monthly_stats.dart';
import '../../data/check_in_yearly_stats.dart';
import '../../data/drug.dart';
import '../../data/employee.dart';
import '../../data/gender.dart';
import '../../data/health_institution.dart';
import '../../data/patient.dart';
import '../../data/stats.dart';
import '../../data/user_role.dart';

abstract class HealthInstitutionRepository {
  /// Returns the list of employees
  Future<Either<ApplicationError, List<Employee>>> listEmployees();

  /// Creates a new employee
  Future<Either<ApplicationError, bool>> createEmployee({
    required String firstName,
    required String lastName,
    required String email,
    required UserRole role,
    required Gender gender,
  });

  /// Returns the details of the health institution of currently logged in user
  Future<Either<ApplicationError, HealthInstitution>> getInstitutionDetails();

  /// Returns the institution stats
  Future<Either<ApplicationError, Stats>> getInstitutionStats();

  /// Returns the list of monthly check in stats
  Future<Either<ApplicationError, List<CheckInMonthlyStats>>>
      getMonthlyCheckInStats();

  /// Returns the list of yearly check in stats
  Future<Either<ApplicationError, List<CheckInYearlyStats>>>
      getYearlyCheckInStats();

  /// Returns the list of patients
  Future<Either<ApplicationError, List<Patient>>> getPatients();

  /// Returns the patient details
  Future<Either<ApplicationError, Patient>> getPatientDetails(String id);

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
  });

  /// List of drugs for health institution
  /// Returns the list of [Drug]
  Future<Either<ApplicationError, List<Drug>>> listDrugs();
}
