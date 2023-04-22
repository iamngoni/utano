part of 'drugs_bloc.dart';

abstract class DrugsEvent extends Equatable {
  const DrugsEvent();
}

class ListDrugs extends DrugsEvent {
  @override
  List<Object> get props => [];
}
