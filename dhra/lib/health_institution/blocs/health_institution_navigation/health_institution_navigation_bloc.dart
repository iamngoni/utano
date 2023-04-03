import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'health_institution_navigation_event.dart';
part 'health_institution_navigation_state.dart';

class HealthInstitutionNavigationBloc extends Bloc<
    HealthInstitutionNavigationEvent, HealthInstitutionNavigationState> {
  HealthInstitutionNavigationBloc()
      : super(HealthInstitutionNavigationInitial()) {
    on<HealthInstitutionNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
