part of 'health_institution_stats_bloc.dart';

abstract class HealthInstitutionStatsState extends Equatable {
  const HealthInstitutionStatsState();
}

class HealthInstitutionStatsInitial extends HealthInstitutionStatsState {
  const HealthInstitutionStatsInitial();
  @override
  List<Object> get props => [];
}

class HealthInstitutionStatsLoading extends HealthInstitutionStatsState {
  const HealthInstitutionStatsLoading();
  @override
  List<Object> get props => [];
}

class HealthInstitutionStatsLoaded extends HealthInstitutionStatsState {
  const HealthInstitutionStatsLoaded(
    this.healthInstitution,
    this.stats,
  );
  final HealthInstitution healthInstitution;
  final Stats stats;

  @override
  List<Object> get props => [healthInstitution, stats];
}

class HealthInstitutionStatsError extends HealthInstitutionStatsState {
  const HealthInstitutionStatsError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
