import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/data/app_exception.dart';
import '../../models/data/check_in.dart';
import '../../models/repos/abstract/system_repository.dart';

part 'check_in_event.dart';
part 'check_in_state.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  CheckInBloc({required this.repository}) : super(CheckInInitial()) {
    on<ListCheckIns>((event, emit) async {
      try {
        emit(CheckInLoading());
        final Either<AppException, List<CheckIn>> response =
            await repository.getCheckIns();
        response.fold(
          (l) => emit(CheckInFailure(l)),
          (r) => emit(CheckInLoaded(r)),
        );
      } catch (e, s) {
        log(e.toString(), error: e, stackTrace: s);
        emit(CheckInFailure(AppException.unknown()));
      }
    });
  }

  final SystemRepository repository;
}
