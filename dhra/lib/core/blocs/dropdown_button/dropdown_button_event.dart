part of 'dropdown_button_bloc.dart';

abstract class DropdownButtonEvent extends Equatable {
  const DropdownButtonEvent();
}

class Selected<T> extends DropdownButtonEvent {
  const Selected(this.option);
  final T option;
  @override
  List<Object> get props => [option as Object];
}
