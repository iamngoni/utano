part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
}

class ChangePassword extends ChangePasswordEvent {
  const ChangePassword({
    required this.oldPassword,
    required this.password,
    required this.passwordConfirmation,
  });

  final String oldPassword;
  final String password;
  final String passwordConfirmation;

  @override
  List<Object> get props => [oldPassword, password, passwordConfirmation];
}

class Reset extends ChangePasswordEvent {
  @override
  List<Object> get props => [];
}
