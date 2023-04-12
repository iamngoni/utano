part of 'check_in_stats_bloc.dart';

abstract class CheckInStatsState extends Equatable {
  const CheckInStatsState();
}

class CheckInStatsInitial extends CheckInStatsState {
  @override
  List<Object> get props => [];
}

class CheckInStatsLoading extends CheckInStatsState {
  @override
  List<Object> get props => [];
}

class CheckInStatsLoaded extends CheckInStatsState {
  const CheckInStatsLoaded({
    required this.monthlyStats,
    required this.yearlyStats,
  });
  final List<CheckInMonthlyStats> monthlyStats;
  final List<CheckInYearlyStats> yearlyStats;

  @override
  List<Object> get props => [monthlyStats, yearlyStats];
}

class CheckInStatsError extends CheckInStatsState {
  const CheckInStatsError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
