part of 'admin_navigation_bloc.dart';

abstract class AdminNavigationState extends Equatable {
  const AdminNavigationState();
}

class AdminNavigationInitial extends AdminNavigationState {
  @override
  List<Object> get props => [];
}
