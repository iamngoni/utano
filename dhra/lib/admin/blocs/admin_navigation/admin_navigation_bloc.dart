import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_navigation_event.dart';
part 'admin_navigation_state.dart';

class AdminNavigationBloc
    extends Bloc<AdminNavigationEvent, AdminNavigationState> {
  AdminNavigationBloc() : super(AdminNavigationInitial()) {
    on<AdminNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
