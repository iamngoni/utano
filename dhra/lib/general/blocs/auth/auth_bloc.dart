import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../../core/configs/configs.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/models/data/auth_response.dart';
import '../../../core/services/di.dart';
import '../../../core/services/secure_storage.dart';
import '../../models/repos/abstract/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
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
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(AuthError(ApplicationError.unknownError()));
      }
    });
    on<AuthLogout>((event, emit) async {
      await di<SecureStorageService>().clearDisk();
      emit(UnAuthenticated());
    });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      final AuthResponse authResponse = AuthResponse.fromJson(json);
      // check if token is not expired
      if (Jwt.isExpired(authResponse.accessToken)) {
        logger.i('Token is expired.');
        return null;
      }

      logger.i('User authenticated using existing token');
      return Authenticated(authResponse);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is Authenticated) {
      return state.authResponse.toJson();
    }

    return null;
  }

  final AuthRepository repository;
}
