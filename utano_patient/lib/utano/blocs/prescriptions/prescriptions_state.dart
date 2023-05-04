part of 'prescriptions_bloc.dart';

abstract class PrescriptionsState extends Equatable {
  const PrescriptionsState();
}

class PrescriptionsInitial extends PrescriptionsState {
  const PrescriptionsInitial();

  @override
  List<Object> get props => [];
}

class PrescriptionsLoading extends PrescriptionsState {
  const PrescriptionsLoading();

  @override
  List<Object> get props => [];
}

class PrescriptionsLoaded extends PrescriptionsState {
  const PrescriptionsLoaded(this.prescriptions);
  final List<Prescription> prescriptions;

  @override
  List<Object> get props => [prescriptions];
}

class PrescriptionsFailure extends PrescriptionsState {
  const PrescriptionsFailure(this.exception);
  final AppException exception;

  @override
  List<Object> get props => [exception];
}
