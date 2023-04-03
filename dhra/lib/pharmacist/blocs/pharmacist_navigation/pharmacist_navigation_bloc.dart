import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pharmacist_navigation_event.dart';
part 'pharmacist_navigation_state.dart';

class PharmacistNavigationBloc
    extends Bloc<PharmacistNavigationEvent, PharmacistNavigationState> {
  PharmacistNavigationBloc() : super(PharmacistNavigationInitial()) {
    on<PharmacistNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
