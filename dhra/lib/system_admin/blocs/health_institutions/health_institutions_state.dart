part of 'health_institutions_bloc.dart';

abstract class HealthInstitutionsState extends Equatable {
  const HealthInstitutionsState();
}

class HealthInstitutionsInitial extends HealthInstitutionsState {
  @override
  List<Object> get props => [];
}

class HealthInstitutionsLoading extends HealthInstitutionsState {
  @override
  List<Object> get props => [];
}

class HealthInstitutionsLoaded extends HealthInstitutionsState {
  const HealthInstitutionsLoaded(this.healthInstitutions);
  final List<HealthInstitution> healthInstitutions;

  @override
  List<Object> get props => [healthInstitutions];
}

class HealthInstitutionsError extends HealthInstitutionsState {
  const HealthInstitutionsError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
