part of 'employees_bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();
}

class EmployeesInitial extends EmployeesState {
  @override
  List<Object> get props => [];
}
