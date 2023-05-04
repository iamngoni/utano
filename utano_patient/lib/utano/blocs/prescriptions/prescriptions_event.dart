part of 'prescriptions_bloc.dart';

abstract class PrescriptionsEvent extends Equatable {
  const PrescriptionsEvent();
}

class ListPrescriptions extends PrescriptionsEvent {
  const ListPrescriptions();

  @override
  List<Object> get props => [];
}
