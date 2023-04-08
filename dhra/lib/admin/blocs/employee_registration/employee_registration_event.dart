part of 'employee_registration_bloc.dart';

abstract class EmployeeRegistrationEvent extends Equatable {
  const EmployeeRegistrationEvent();
}

class RegisterEmployee extends EmployeeRegistrationEvent {
  const RegisterEmployee({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.gender,
  });

  final String firstName;
  final String lastName;
  final String email;
  final UserRole role;
  final Gender gender;

  @override
  List<Object> get props => [firstName, lastName, email, role, gender];
}

class ResetRegistrationForm extends EmployeeRegistrationEvent {
  const ResetRegistrationForm();
  @override
  List<Object> get props => [];
}
