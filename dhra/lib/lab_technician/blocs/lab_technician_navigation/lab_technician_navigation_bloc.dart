import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lab_technician_navigation_event.dart';
part 'lab_technician_navigation_state.dart';

class LabTechnicianNavigationBloc
    extends Bloc<LabTechnicianNavigationEvent, LabTechnicianNavigationState> {
  LabTechnicianNavigationBloc() : super(LabTechnicianNavigationInitial()) {
    on<LabTechnicianNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
