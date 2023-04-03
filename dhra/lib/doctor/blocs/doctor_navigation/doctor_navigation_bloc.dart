import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doctor_navigation_event.dart';
part 'doctor_navigation_state.dart';

class DoctorNavigationBloc
    extends Bloc<DoctorNavigationEvent, DoctorNavigationState> {
  DoctorNavigationBloc() : super(DoctorNavigationInitial()) {
    on<DoctorNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
