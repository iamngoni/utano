part of 'doctor_navigation_bloc.dart';

abstract class DoctorNavigationState extends Equatable {
  const DoctorNavigationState();
}

class DoctorNavigationInitial extends DoctorNavigationState {
  @override
  List<Object> get props => [];
}
