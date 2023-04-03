part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
}

class Navigation extends NavigationState {
  const Navigation(this.index);
  final int index;
  @override
  List<Object> get props => [index];
}
