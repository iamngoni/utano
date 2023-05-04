import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../../core/configs/storage_keys.dart';
import '../../../core/models/data/app_exception.dart';
import '../../../core/models/data/auth_response.dart';
import '../../../core/models/data/user.dart';
import '../../../core/services/di.dart';
import '../../../core/services/secure_storage.dart';
import '../../models/repos/abstract/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      try {
        final Either<AppException, AuthResponse> response =
            await repository.login(
          event.email,
          event.password,
        );
        response.fold((l) => emit(AuthFailure(l)), (r) async {
          emit(AuthSuccess(
            r.user,
            accessToken: r.accessToken,
            refreshToken: r.refreshToken,
          ));
          await di<SecureStorageService>()
              .saveToDisk(StorageKeys.accessToken, r.accessToken);
          await di<SecureStorageService>()
              .saveToDisk(StorageKeys.refreshToken, r.refreshToken);
        });
      } catch (e, s) {
        log(e.toString(), error: e, stackTrace: s);
        emit(AuthFailure(AppException.unknown()));
      }
    });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      final AuthResponse authResponse = AuthResponse.fromJson(json);
      // check if token is not expired
      if (Jwt.isExpired(authResponse.accessToken)) {
        log('Token is expired.');
        return null;
      }

      log('User authenticated using existing token');
      return AuthSuccess(
        authResponse.user,
        accessToken: authResponse.accessToken,
        refreshToken: authResponse.refreshToken,
      );
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthSuccess) {
      return {
        'access_token': state.accessToken,
        'refresh_token': state.refreshToken,
        'user': state.user.toJson(),
      };
    }

    return null;
  }

  final AuthRepository repository;
}
