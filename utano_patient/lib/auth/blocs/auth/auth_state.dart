part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  const AuthSuccess(
    this.user, {
    required this.accessToken,
    required this.refreshToken,
  });

  final User user;
  final String accessToken;
  final String refreshToken;

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthState {
  const AuthFailure(this.exception);

  final AppException exception;

  @override
  List<Object> get props => [exception];
}
