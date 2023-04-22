import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/configs/logger.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/models/repos/abstract/health_institution_repository.dart';
import '../../models/data/drug.dart';

part 'drugs_event.dart';
part 'drugs_state.dart';

class DrugsBloc extends Bloc<DrugsEvent, DrugsState> {
  DrugsBloc({required this.repository}) : super(const DrugsInitial()) {
    on<ListDrugs>((event, emit) async {
      emit(const DrugsLoading());
      try {
        final Either<ApplicationError, List<Drug>> response =
            await repository.listDrugs();
        response.fold(
          (l) => emit(DrugsError(l)),
          (r) => emit(DrugsLoaded(r)),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(DrugsError(ApplicationError.unknownError()));
      }
    });
  }

  final HealthInstitutionRepository repository;
}
