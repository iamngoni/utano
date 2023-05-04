part of 'check_in_bloc.dart';

abstract class CheckInState extends Equatable {
  const CheckInState();
}

class CheckInInitial extends CheckInState {
  const CheckInInitial();

  @override
  List<Object> get props => [];
}

class CheckInLoading extends CheckInState {
  const CheckInLoading();

  @override
  List<Object> get props => [];
}

class CheckInLoaded extends CheckInState {
  const CheckInLoaded(this.checkIns);
  final List<CheckIn> checkIns;

  @override
  List<Object> get props => [checkIns];
}

class CheckInFailure extends CheckInState {
  const CheckInFailure(this.exception);
  final AppException exception;

  @override
  List<Object> get props => [exception];
}
