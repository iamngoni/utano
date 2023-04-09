import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'health_institution_stats_event.dart';
part 'health_institution_stats_state.dart';

class HealthInstitutionStatsBloc extends Bloc<HealthInstitutionStatsEvent, HealthInstitutionStatsState> {
  HealthInstitutionStatsBloc() : super(HealthInstitutionStatsInitial()) {
    on<HealthInstitutionStatsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
