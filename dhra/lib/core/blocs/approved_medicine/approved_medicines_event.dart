part of 'approved_medicines_bloc.dart';

abstract class ApprovedMedicineEvent extends Equatable {
  const ApprovedMedicineEvent();
}

class ListApprovedMedicines extends ApprovedMedicineEvent {
  @override
  List<Object> get props => [];
}
