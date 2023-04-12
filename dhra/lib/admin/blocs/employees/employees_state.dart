part of 'employees_bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();
}

class EmployeesInitial extends EmployeesState {
  @override
  List<Object> get props => [];
}

class EmployeesLoading extends EmployeesState {
  @override
  List<Object> get props => [];
}

class EmployeesLoaded extends EmployeesState {
  const EmployeesLoaded(this.employees);
  final List<Employee> employees;

  @override
  List<Object> get props => [employees];
}

class EmployeesError extends EmployeesState {
  const EmployeesError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
