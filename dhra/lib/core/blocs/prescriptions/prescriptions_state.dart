part of 'prescriptions_bloc.dart';

abstract class PrescriptionsState extends Equatable {
  const PrescriptionsState();
}

class PrescriptionsInitial extends PrescriptionsState {
  @override
  List<Object> get props => [];
}

class PrescriptionsLoading extends PrescriptionsState {
  @override
  List<Object> get props => [];
}

class PrescriptionsLoaded extends PrescriptionsState {
  const PrescriptionsLoaded(
    this.prescriptions, {
    this.prescription,
  });
  final List<Prescription> prescriptions;
  final Prescription? prescription;

  @override
  List<Object?> get props => [prescriptions, prescription];
}

class PrescriptionsError extends PrescriptionsState {
  const PrescriptionsError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
