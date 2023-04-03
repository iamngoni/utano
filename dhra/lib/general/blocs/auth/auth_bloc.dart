import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/application_error.dart';
import '../../../core/models/auth_response.dart';
import '../../../core/services/di.dart';
import '../../../core/services/secure_storage.dart';
import '../../models/repos/abstract/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(UnAuthenticated()) {
    on<AuthLogin>((event, emit) async {
      try {
        emit(AuthLoading());
        final Either<ApplicationError, AuthResponse> response =
            await repository.login(
          event.email,
          event.password,
        );
        response.fold((ApplicationError error) => emit(AuthError(error)),
            (AuthResponse response) async {
          emit(Authenticated(response));
          await di<SecureStorageService>()
              .saveToDisk('access_token', response.accessToken);
          await di<SecureStorageService>()
              .saveToDisk('refresh_token', response.refreshToken);
        });
      } catch (e) {
        emit(AuthError(ApplicationError.unknownError()));
      }
    });
    on<AuthLogout>((event, emit) async {
      await di<SecureStorageService>().clearDisk();
      emit(UnAuthenticated());
    });
  }

  final AuthRepository repository;
}
