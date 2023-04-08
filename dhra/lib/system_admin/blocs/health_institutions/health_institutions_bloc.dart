import 'dart:io';

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
        emit(HealthInstitutionsLoading());
        final Either<ApplicationError, List<HealthInstitution>> response =
            await repository.listHealthInstitutions();
        response.fold(
          (ApplicationError error) => emit(HealthInstitutionsError(error)),
          (List<HealthInstitution> healthInstitutions) =>
              emit(HealthInstitutionsLoaded(healthInstitutions)),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(HealthInstitutionsError(ApplicationError.unknownError()));
      }
    });
    on<RegisterHealthInstitution>((event, emit) async {
      try {
        emit(HealthInstitutionsLoading());
        final Either<ApplicationError, HealthInstitution> response =
            await repository.registerHealthInstitution(
          name: event.name,
          address: event.address,
          phoneNumber: event.phoneNumber,
          email: event.email,
          logo: event.logo,
          district: event.district,
        );
        response.fold((l) => emit(HealthInstitutionsError(l)), (r) {
          emit(HealthInstitutionsLoaded([r]));
          add(ListHealthInstitutions());
        });
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
