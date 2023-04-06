part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class Navigate extends NavigationEvent {
  const Navigate(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}
