part of 'prescriptions_bloc.dart';

abstract class PrescriptionsEvent extends Equatable {
  const PrescriptionsEvent();
}

class ListPrescriptions extends PrescriptionsEvent {
  @override
  List<Object> get props => [];
}

class GetPrescription extends PrescriptionsEvent {
  const GetPrescription(this.prescriptionNumber);
  final String prescriptionNumber;

  @override
  List<Object> get props => [prescriptionNumber];
}
