part of 'check_in_bloc.dart';

abstract class CheckInEvent extends Equatable {
  const CheckInEvent();
}

class ListCheckIns extends CheckInEvent {
  const ListCheckIns();

  @override
  List<Object> get props => [];
}
