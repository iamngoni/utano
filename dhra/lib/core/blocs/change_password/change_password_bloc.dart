import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../general/models/repos/abstract/auth_repository.dart';
import '../../configs/configs.dart';
import '../../models/data/application_error.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({required this.repository})
      : super(const ChangePasswordInitial()) {
    on<ChangePassword>((event, emit) async {
      try {
        emit(ChangePasswordLoading());
        final Either<ApplicationError, void> response =
            await repository.updatePassword(
          oldPassword: event.oldPassword,
          password: event.password,
          passwordConfirmation: event.passwordConfirmation,
        );
        response.fold(
          (l) => emit(ChangePasswordError(l)),
          (r) => emit(const ChangePasswordInitial()),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(ChangePasswordError(ApplicationError.unknownError()));
      }
    });
    on<Reset>((event, emit) {
      emit(const ChangePasswordInitial(reset: true));
    });
  }

  final AuthRepository repository;
}
