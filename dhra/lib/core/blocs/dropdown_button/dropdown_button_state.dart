part of 'dropdown_button_bloc.dart';

abstract class DropdownButtonState extends Equatable {
  const DropdownButtonState();
}

class DropdownButtonInitial extends DropdownButtonState {
  @override
  List<Object> get props => [];
}

class DropdownButtonOptionSelected<T> extends DropdownButtonState {
  const DropdownButtonOptionSelected(this.option);
  final T option;

  @override
  List<Object> get props => [option as Object];
}
