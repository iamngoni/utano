part of 'employees_bloc.dart';

abstract class EmployeesEvent extends Equatable {
  const EmployeesEvent();
}

class ListEmployees extends EmployeesEvent {
  @override
  List<Object> get props => [];
}
