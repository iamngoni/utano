part of 'check_in_stats_bloc.dart';

abstract class CheckInStatsEvent extends Equatable {
  const CheckInStatsEvent();
}

class LoadCheckInStats extends CheckInStatsEvent {
  const LoadCheckInStats();

  @override
  List<Object> get props => [];
}
