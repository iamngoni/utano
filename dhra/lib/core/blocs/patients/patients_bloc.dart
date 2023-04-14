import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../configs/configs.dart';
import '../../models/data/application_error.dart';
import '../../models/data/patient.dart';
import '../../models/repos/abstract/health_institution_repository.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  PatientsBloc({required this.repository}) : super(const PatientsInitial()) {
    on<ListPatients>((event, emit) async {
      emit(const PatientsLoading());
      try {
        final Either<ApplicationError, List<Patient>> response =
            await repository.getPatients();
        response.fold(
          (l) => emit(PatientsError(l)),
          (r) => emit(PatientsLoaded(r)),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(PatientsError(ApplicationError.unknownError()));
      }
    });
  }

  final HealthInstitutionRepository repository;
}
