part of 'health_institution_employees_bloc.dart';

abstract class HealthInstitutionEmployeesEvent extends Equatable {
  const HealthInstitutionEmployeesEvent();
}

class ListHealthInstitutionEmployees extends HealthInstitutionEmployeesEvent {
  const ListHealthInstitutionEmployees(this.healthInstitution);
  final HealthInstitution healthInstitution;

  @override
  List<Object> get props => [healthInstitution];
}

class ResetState extends HealthInstitutionEmployeesEvent {
  const ResetState();
  @override
  List<Object> get props => [];
}
