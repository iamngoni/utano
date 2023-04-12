part of 'system_stats_bloc.dart';

abstract class SystemStatsState extends Equatable {
  const SystemStatsState();
}

class SystemStatsInitial extends SystemStatsState {
  const SystemStatsInitial();
  @override
  List<Object> get props => [];
}

class SystemStatsLoading extends SystemStatsState {
  const SystemStatsLoading();
  @override
  List<Object> get props => [];
}

class SystemStatsLoaded extends SystemStatsState {
  const SystemStatsLoaded(this.stats);
  final SystemStats stats;

  @override
  List<Object> get props => [stats];
}

class SystemStatsError extends SystemStatsState {
  const SystemStatsError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
