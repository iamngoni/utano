import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nurse_navigation_event.dart';
part 'nurse_navigation_state.dart';

class NurseNavigationBloc
    extends Bloc<NurseNavigationEvent, NurseNavigationState> {
  NurseNavigationBloc() : super(NurseNavigationInitial()) {
    on<NurseNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
