part of 'health_institutions_bloc.dart';

abstract class HealthInstitutionsState extends Equatable {
  const HealthInstitutionsState();
}

class HealthInstitutionsInitial extends HealthInstitutionsState {
  const HealthInstitutionsInitial();

  @override
  List<Object> get props => [];
}

class HealthInstitutionsLoading extends HealthInstitutionsState {
  const HealthInstitutionsLoading();

  @override
  List<Object> get props => [];
}

class HealthInstitutionsLoaded extends HealthInstitutionsState {
  const HealthInstitutionsLoaded(this.healthInstitutions);
  final List<HealthInstitution> healthInstitutions;

  @override
  List<Object> get props => [healthInstitutions];
}

class HealthInstitutionsFailure extends HealthInstitutionsState {
  const HealthInstitutionsFailure(this.exception);
  final AppException exception;

  @override
  List<Object> get props => [exception];
}
