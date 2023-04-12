part of 'patients_bloc.dart';

abstract class PatientsState extends Equatable {
  const PatientsState();
}

class PatientsInitial extends PatientsState {
  @override
  List<Object> get props => [];
}
