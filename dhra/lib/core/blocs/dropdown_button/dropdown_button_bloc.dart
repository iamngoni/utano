import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_button_event.dart';
part 'dropdown_button_state.dart';

class DropdownButtonBloc<T>
    extends Bloc<DropdownButtonEvent, DropdownButtonState> {
  DropdownButtonBloc() : super(DropdownButtonInitial()) {
    on<Selected<T>>((event, emit) {
      emit(DropdownButtonOptionSelected(event.option));
    });
  }
}
