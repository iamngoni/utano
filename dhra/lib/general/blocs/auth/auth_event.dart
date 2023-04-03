part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthLogin extends AuthEvent {
  const AuthLogin({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [];
}

class AuthLogout extends AuthEvent {
  @override
  List<Object> get props => [];
}
