part of 'health_institution_stats_bloc.dart';

abstract class HealthInstitutionStatsEvent extends Equatable {
  const HealthInstitutionStatsEvent();
}

class GetStatistics extends HealthInstitutionStatsEvent {
  @override
  List<Object> get props => [];
}
