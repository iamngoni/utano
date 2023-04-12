part of 'employee_registration_bloc.dart';

abstract class EmployeeRegistrationState extends Equatable {
  const EmployeeRegistrationState();
}

class EmployeeRegistrationInitial extends EmployeeRegistrationState {
  const EmployeeRegistrationInitial({this.reset = false});
  final bool reset;
  @override
  List<Object> get props => [];
}

class EmployeeRegistrationLoading extends EmployeeRegistrationState {
  const EmployeeRegistrationLoading();

  @override
  List<Object> get props => [];
}

class EmployeeRegistrationError extends EmployeeRegistrationState {
  const EmployeeRegistrationError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
