part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();
}

class ChangePasswordInitial extends ChangePasswordState {
  const ChangePasswordInitial({this.reset = false});
  final bool reset;
  @override
  List<Object> get props => [reset];
}

class ChangePasswordLoading extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

class ChangePasswordError extends ChangePasswordState {
  const ChangePasswordError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
