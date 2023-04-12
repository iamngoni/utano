import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/data/application_error.dart';
import '../../models/data/patient.dart';
import '../../models/repos/abstract/health_institution_repository.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  PatientsBloc({required this.repository}) : super(PatientsInitial()) {
    on<ListPatients>((event, emit) async {
      // TODO: implement event handler
    });
  }

  final HealthInstitutionRepository repository;
}
