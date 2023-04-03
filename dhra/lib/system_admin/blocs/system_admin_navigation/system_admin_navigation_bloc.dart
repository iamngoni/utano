import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'system_admin_navigation_event.dart';
part 'system_admin_navigation_state.dart';

class SystemAdminNavigationBloc
    extends Bloc<SystemAdminNavigationEvent, SystemAdminNavigationState> {
  SystemAdminNavigationBloc() : super(SystemAdminNavigationInitial()) {
    on<SystemAdminNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
