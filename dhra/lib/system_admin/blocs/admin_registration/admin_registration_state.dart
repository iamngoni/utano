part of 'admin_registration_bloc.dart';

abstract class AdminRegistrationState extends Equatable {
  const AdminRegistrationState();
}

class AdminRegistrationInitial extends AdminRegistrationState {
  const AdminRegistrationInitial({this.reset = false});
  final bool reset;
  @override
  List<Object> get props => [];
}

class AdminRegistrationLoading extends AdminRegistrationState {
  const AdminRegistrationLoading();

  @override
  List<Object> get props => [];
}

class AdminRegistrationError extends AdminRegistrationState {
  const AdminRegistrationError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
