import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  PatientsBloc() : super(PatientsInitial()) {
    on<PatientsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
