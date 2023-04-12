part of 'patients_bloc.dart';

abstract class PatientsEvent extends Equatable {
  const PatientsEvent();
}

class ListPatients extends PatientsEvent {
  const ListPatients();

  @override
  List<Object> get props => [];
}
