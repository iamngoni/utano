import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc({required this.screens}) : super(const Navigation(0)) {
    on<Navigate>((event, emit) {
      emit(Navigation(event.index));
    });
  }

  final List<Widget> screens;
}
