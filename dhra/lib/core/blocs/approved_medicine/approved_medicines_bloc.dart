import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../configs/configs.dart';
import '../../models/data/application_error.dart';
import '../../models/data/approved_medicine.dart';
import '../../models/repos/abstract/health_institution_repository.dart';

part 'approved_medicines_event.dart';
part 'approved_medicines_state.dart';

class ApprovedMedicinesBloc
    extends Bloc<ApprovedMedicineEvent, ApprovedMedicinesState> {
  ApprovedMedicinesBloc({required this.repository})
      : super(const ApprovedMedicinesInitial()) {
    on<ListApprovedMedicines>((event, emit) async {
      emit(const ApprovedMedicinesLoading());
      try {
        final Either<ApplicationError, List<ApprovedMedicine>> response =
            await repository.listApprovedMedicines();
        response.fold(
          (l) => emit(ApprovedMedicinesError(l)),
          (r) => emit(ApprovedMedicinesLoaded(r)),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(ApprovedMedicinesError(ApplicationError.unknownError()));
      }
    });
  }

  final HealthInstitutionRepository repository;
}
