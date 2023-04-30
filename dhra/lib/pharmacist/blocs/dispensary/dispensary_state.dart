part of 'dispensary_bloc.dart';

abstract class DispensaryState extends Equatable {
  const DispensaryState();
}

class DispensaryInitial extends DispensaryState {
  const DispensaryInitial({this.dispense});

  final Dispense? dispense;

  @override
  List<Object> get props => [];
}

class DispensaryLoading extends DispensaryState {
  const DispensaryLoading();

  @override
  List<Object> get props => [];
}

class DispensaryLoaded extends DispensaryState {
  const DispensaryLoaded(this.prescription);
  final Prescription prescription;
  @override
  List<Object> get props => [prescription];
}

class DispensaryError extends DispensaryState {
  const DispensaryError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
