import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/configs/configs.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/models/data/dispense.dart';
import '../../../core/models/data/prescription.dart';
import '../../../core/models/repos/abstract/health_institution_repository.dart';
import '../../models/data/dispense_drug.dart';

part 'dispensary_event.dart';
part 'dispensary_state.dart';

class DispensaryBloc extends Bloc<DispensaryEvent, DispensaryState> {
  DispensaryBloc({required this.repository})
      : super(const DispensaryInitial()) {
    on<GetPrescription>(_getPrescription);
    on<ProcessPrescription>(_processPrescription);
    on<Reset>(_reset);
  }

  Future<void> _getPrescription(
    GetPrescription event,
    Emitter<DispensaryState> emit,
  ) async {
    emit(const DispensaryLoading());
    try {
      final Either<ApplicationError, Prescription> response =
          await repository.getPrescription(event.prescriptionNumber);
      response.fold(
        (l) => emit(DispensaryError(l)),
        (r) => emit(DispensaryLoaded(r)),
      );
    } catch (e, s) {
      logger
        ..e(e)
        ..e(s);
      emit(DispensaryError(ApplicationError.unknownError()));
    }
  }

  Future<void> _processPrescription(
    ProcessPrescription event,
    Emitter<DispensaryState> emit,
  ) async {
    emit(const DispensaryLoading());
    try {
      final Either<ApplicationError, Dispense> response = await repository
          .processPrescription(event.prescription, event.dispensedDrugs);
      response.fold(
        (l) => emit(DispensaryError(l)),
        (r) => emit(DispensaryInitial(dispense: r)),
      );
    } catch (e, s) {
      logger
        ..e(e)
        ..e(s);
      emit(DispensaryError(ApplicationError.unknownError()));
    }
  }

  Future<void> _reset(
    Reset event,
    Emitter<DispensaryState> emit,
  ) async {
    emit(const DispensaryInitial());
  }

  final HealthInstitutionRepository repository;
}
