import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/data/app_exception.dart';
import '../../models/data/prescription.dart';
import '../../models/repos/abstract/system_repository.dart';

part 'prescriptions_event.dart';
part 'prescriptions_state.dart';

class PrescriptionsBloc extends Bloc<PrescriptionsEvent, PrescriptionsState> {
  PrescriptionsBloc({required this.repository})
      : super(PrescriptionsInitial()) {
    on<ListPrescriptions>((event, emit) async {
      try {
        emit(PrescriptionsLoading());
        final Either<AppException, List<Prescription>> response =
            await repository.getPrescriptions();
        response.fold(
          (l) => emit(PrescriptionsFailure(l)),
          (r) => emit(PrescriptionsLoaded(r)),
        );
      } catch (e, s) {
        log(e.toString(), error: e, stackTrace: s);
        emit(PrescriptionsFailure(AppException.unknown()));
      }
    });
  }

  final SystemRepository repository;
}
