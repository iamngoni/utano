part of 'health_institution_employees_bloc.dart';

abstract class HealthInstitutionEmployeesState extends Equatable {
  const HealthInstitutionEmployeesState();
}

class HealthInstitutionEmployeesInitial
    extends HealthInstitutionEmployeesState {
  const HealthInstitutionEmployeesInitial();
  @override
  List<Object> get props => [];
}

class HealthInstitutionEmployeesLoading
    extends HealthInstitutionEmployeesState {
  const HealthInstitutionEmployeesLoading();

  @override
  List<Object> get props => [];
}

class HealthInstitutionEmployeesLoaded extends HealthInstitutionEmployeesState {
  const HealthInstitutionEmployeesLoaded(
    this.healthInstitution,
    this.employees,
  );
  final HealthInstitution healthInstitution;
  final List<Employee> employees;

  @override
  List<Object> get props => [healthInstitution, employees];
}

class HealthInstitutionEmployeesError extends HealthInstitutionEmployeesState {
  const HealthInstitutionEmployeesError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
