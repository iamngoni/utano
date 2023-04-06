part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  const Authenticated(this.authResponse);

  final AuthResponse authResponse;

  @override
  List<Object> get props => [authResponse];
}

class AuthError extends AuthState {
  const AuthError(this.error);

  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
