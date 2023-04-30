part of 'dispensary_bloc.dart';

abstract class DispensaryEvent extends Equatable {
  const DispensaryEvent();
}

class GetPrescription extends DispensaryEvent {
  const GetPrescription(this.prescriptionNumber);
  final String prescriptionNumber;

  @override
  List<Object> get props => [prescriptionNumber];
}

class ProcessPrescription extends DispensaryEvent {
  const ProcessPrescription(this.prescription, this.dispensedDrugs);
  final Prescription prescription;
  final List<DispenseDrug> dispensedDrugs;

  @override
  List<Object> get props => [prescription, dispensedDrugs];
}

class Reset extends DispensaryEvent {
  @override
  List<Object> get props => [];
}
