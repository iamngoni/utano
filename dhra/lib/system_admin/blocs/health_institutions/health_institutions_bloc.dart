import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/configs/configs.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/models/data/health_institution.dart';
import '../../models/repos/abstract/system_admin_repository.dart';

part 'health_institutions_event.dart';
part 'health_institutions_state.dart';

class HealthInstitutionsBloc
    extends Bloc<HealthInstitutionsEvent, HealthInstitutionsState> {
  HealthInstitutionsBloc({required this.repository})
      : super(HealthInstitutionsInitial()) {
    on<ListHealthInstitutions>((event, emit) async {
      try {
        final Either<ApplicationError, List<HealthInstitution<String>>>
            response = await repository.listHealthInstitutions();
        response.fold(
          (ApplicationError error) => emit(HealthInstitutionsError(error)),
          (List<HealthInstitution<String>> healthInstitutions) =>
              emit(HealthInstitutionsLoaded(healthInstitutions)),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(HealthInstitutionsError(ApplicationError.unknownError()));
      }
    });
  }

  final SystemAdminRepository repository;
}
