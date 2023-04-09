import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_in_stats_event.dart';
part 'check_in_stats_state.dart';

class CheckInStatsBloc extends Bloc<CheckInStatsEvent, CheckInStatsState> {
  CheckInStatsBloc() : super(CheckInStatsInitial()) {
    on<CheckInStatsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
