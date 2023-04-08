part of 'system_stats_bloc.dart';

abstract class SystemStatsEvent extends Equatable {}

class GetStatistics extends SystemStatsEvent {
  @override
  List<Object> get props => [];
}
