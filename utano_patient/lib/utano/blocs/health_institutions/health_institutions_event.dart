part of 'health_institutions_bloc.dart';

abstract class HealthInstitutionsEvent extends Equatable {
  const HealthInstitutionsEvent();
}

class ListHealthInstitutions extends HealthInstitutionsEvent {
  const ListHealthInstitutions();

  @override
  List<Object> get props => [];
}
