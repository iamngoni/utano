import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/data/app_exception.dart';
import '../../models/data/health_institution.dart';
import '../../models/repos/abstract/system_repository.dart';

part 'health_institutions_event.dart';
part 'health_institutions_state.dart';

class HealthInstitutionsBloc
    extends Bloc<HealthInstitutionsEvent, HealthInstitutionsState> {
  HealthInstitutionsBloc({required this.repository})
      : super(HealthInstitutionsInitial()) {
    on<ListHealthInstitutions>((event, emit) async {
      try {
        emit(HealthInstitutionsLoading());
        final Either<AppException, List<HealthInstitution>> response =
            await repository.getHealthInstitutions();

        response.fold(
          (l) => emit(HealthInstitutionsFailure(l)),
          (r) => emit(HealthInstitutionsLoaded(r)),
        );
      } catch (e, s) {
        log(e.toString(), error: e, stackTrace: s);
        emit(HealthInstitutionsFailure(AppException.unknown()));
      }
    });
  }

  final SystemRepository repository;
}
