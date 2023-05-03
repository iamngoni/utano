import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/data/app_exception.dart';
import '../../../core/models/data/auth_response.dart';
import '../../../core/models/data/employment_status.dart';
import '../../../core/models/data/gender.dart';
import '../../../core/models/data/marital_status.dart';
import '../../models/repos/abstract/auth_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.repository}) : super(SignUpInitial()) {
    on<SignUp>((event, emit) async {
      emit(SignUpLoading());
      try {
        final Either<AppException, AuthResponse> response =
            await repository.register(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          mobileNumber: event.mobileNumber,
          gender: event.gender,
          dateOfBirth: event.dateOfBirth,
          maritalStatus: event.maritalStatus,
          nationalIdNumber: event.nationalIdNumber,
          address: event.address,
          employmentStatus: event.employmentStatus,
          password: event.password,
          passwordConfirmation: event.passwordConfirmation,
        );
        response.fold(
          (l) => emit(SignUpFailure(l)),
          (r) => emit(SignUpSuccess()),
        );
      } catch (e, s) {
        log(e.toString(), error: e, stackTrace: s);
        emit(SignUpFailure(AppException.unknown()));
      }
    });
  }

  final AuthRepository repository;
}
