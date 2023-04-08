part of 'admin_registration_bloc.dart';

abstract class AdminRegistrationEvent extends Equatable {
  const AdminRegistrationEvent();
}

class RegisterAdmin extends AdminRegistrationEvent {
  const RegisterAdmin({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.healthInstitution,
  });

  final String firstName;
  final String lastName;
  final String email;
  final Gender gender;
  final HealthInstitution healthInstitution;

  @override
  List<Object> get props =>
      [firstName, lastName, email, healthInstitution, gender];
}

class ResetRegistrationForm extends AdminRegistrationEvent {
  const ResetRegistrationForm();
  @override
  List<Object> get props => [];
}
