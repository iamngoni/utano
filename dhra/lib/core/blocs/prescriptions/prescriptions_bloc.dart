import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../configs/configs.dart';
import '../../models/data/application_error.dart';
import '../../models/data/prescription.dart';
import '../../models/repos/abstract/health_institution_repository.dart';

part 'prescriptions_event.dart';
part 'prescriptions_state.dart';

class PrescriptionsBloc extends Bloc<PrescriptionsEvent, PrescriptionsState> {
  PrescriptionsBloc({required this.repository})
      : super(PrescriptionsInitial()) {
    on<ListPrescriptions>(_listPrescriptions);
    on<GetPrescription>(_getPrescription);
  }

  Future<void> _listPrescriptions(
    ListPrescriptions event,
    Emitter<PrescriptionsState> emit,
  ) async {
    emit(PrescriptionsLoading());
    try {
      final Either<ApplicationError, List<Prescription>> response =
          await repository.listPrescriptions();
      response.fold(
        (l) => emit(PrescriptionsError(l)),
        (r) => emit(PrescriptionsLoaded(r)),
      );
    } catch (e, s) {
      logger
        ..e(e)
        ..e(s);
      emit(PrescriptionsError(ApplicationError.unknownError()));
    }
  }

  Future<void> _getPrescription(
    GetPrescription event,
    Emitter<PrescriptionsState> emit,
  ) async {
    try {
      List<Prescription> prescriptions = [];
      if (state is PrescriptionsLoaded) {
        prescriptions = (state as PrescriptionsLoaded).prescriptions;
      }

      emit(PrescriptionsLoading());
      final Either<ApplicationError, Prescription> response =
          await repository.getPrescription(event.prescriptionNumber);
      response.fold(
        (l) => emit(PrescriptionsError(l)),
        (r) => emit(PrescriptionsLoaded(prescriptions, prescription: r)),
      );
    } catch (e, s) {
      logger
        ..e(e)
        ..e(s);
      emit(PrescriptionsError(ApplicationError.unknownError()));
    }
  }

  final HealthInstitutionRepository repository;
}
