part of 'stats_bloc.dart';

abstract class StatsState extends Equatable {
  const StatsState();
}

class StatsInitial extends StatsState {
  @override
  List<Object> get props => [];
}
