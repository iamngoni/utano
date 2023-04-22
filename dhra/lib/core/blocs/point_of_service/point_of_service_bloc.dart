import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../configs/configs.dart';
import '../../models/data/application_error.dart';
import '../../models/data/check_in.dart';
import '../../models/data/patient.dart';
import '../../models/repos/abstract/health_institution_repository.dart';

part 'point_of_service_event.dart';
part 'point_of_service_state.dart';

class PointOfServiceBloc
    extends Bloc<PointOfServiceEvent, PointOfServiceState> {
  PointOfServiceBloc({required this.repository})
      : super(const PointOfServiceIdle()) {
    on<ResetToIdle>(_resetToIdle);
    on<CheckInPatient>(_checkInPatient);
  }

  void _resetToIdle(ResetToIdle event, Emitter<PointOfServiceState> emit) {
    emit(const PointOfServiceIdle());
  }

  Future<void> _checkInPatient(
    CheckInPatient event,
    Emitter<PointOfServiceState> emit,
  ) async {
    emit(const PointOfServiceLoading());
    try {
      final Either<ApplicationError, CheckIn> response =
          await repository.checkInPatient(
        firstName: event.firstName,
        lastName: event.lastName,
        mobileNumber: event.mobileNumber,
        gender: event.gender,
        address: event.address,
        age: event.age,
        dateOfBirth: event.dateOfBirth,
        temperature: event.temperature,
        systolicBloodPressure: event.systolicBloodPressure,
        diastolicBloodPressure: event.diastolicBloodPressure,
        pulse: event.pulse,
        respiratoryRate: event.respiratoryRate,
        patientNotes: event.patientNotes,
        examinationNotes: event.examinationNotes,
        diagnosisNotes: event.diagnosisNotes,
        treatmentNotes: event.treatmentNotes,
      );
      response.fold(
        (l) => emit(PointOfServiceError(l)),
        (r) => emit(
          PointOfServiceIdle(
            patient: r.patient,
          ),
        ),
      );
    } catch (e, s) {
      logger
        ..e(e)
        ..e(s);
      emit(PointOfServiceError(ApplicationError.unknownError()));
    }
  }

  final HealthInstitutionRepository repository;
}
