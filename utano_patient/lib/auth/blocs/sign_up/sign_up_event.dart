part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUp extends SignUpEvent {
  const SignUp({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.maritalStatus,
    required this.nationalIdNumber,
    required this.address,
    required this.employmentStatus,
    required this.password,
    required this.passwordConfirmation,
  });
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final Gender gender;
  final DateTime dateOfBirth;
  final MaritalStatus maritalStatus;
  final String nationalIdNumber;
  final String address;
  final EmploymentStatus employmentStatus;
  final String password;
  final String passwordConfirmation;

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        mobileNumber,
        gender,
        dateOfBirth,
        maritalStatus,
        nationalIdNumber,
        address,
        employmentStatus,
        password,
        passwordConfirmation,
      ];
}
