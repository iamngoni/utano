part of 'drugs_bloc.dart';

abstract class DrugsState extends Equatable {
  const DrugsState();
}

class DrugsInitial extends DrugsState {
  const DrugsInitial();
  @override
  List<Object> get props => [];
}

class DrugsLoading extends DrugsState {
  const DrugsLoading();
  @override
  List<Object> get props => [];
}

class DrugsLoaded extends DrugsState {
  const DrugsLoaded(this.drugs);
  final List<Drug> drugs;
  @override
  List<Object> get props => [drugs];
}

class DrugsError extends DrugsState {
  const DrugsError(this.error);
  final ApplicationError error;
  @override
  List<Object> get props => [error];
}
