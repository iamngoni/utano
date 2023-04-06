part of 'health_institutions_bloc.dart';

abstract class HealthInstitutionsEvent extends Equatable {
  const HealthInstitutionsEvent();
}

class ListHealthInstitutions extends HealthInstitutionsEvent {
  @override
  List<Object> get props => [];
}

class RegisterHealthInstitution extends HealthInstitutionsEvent {
  const RegisterHealthInstitution({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.logo,
    required this.district,
  });

  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final File logo;
  final String district;
  @override
  List<Object> get props => [];
}
