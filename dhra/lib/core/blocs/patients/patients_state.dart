part of 'patients_bloc.dart';

abstract class PatientsState extends Equatable {
  const PatientsState();
}

class PatientsInitial extends PatientsState {
  const PatientsInitial();
  @override
  List<Object> get props => [];
}

class PatientsLoading extends PatientsState {
  const PatientsLoading();
  @override
  List<Object> get props => [];
}

class PatientsLoaded extends PatientsState {
  const PatientsLoaded(this.patients);
  final List<Patient> patients;

  @override
  List<Object> get props => [patients];
}

class PatientsError extends PatientsState {
  const PatientsError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
