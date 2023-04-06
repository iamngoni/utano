part of 'system_configs_bloc.dart';

abstract class SystemConfigsState extends Equatable {
  const SystemConfigsState();
}

class SystemConfigsInitial extends SystemConfigsState {
  @override
  List<Object> get props => [];
}

class SystemConfigsLoading extends SystemConfigsState {
  @override
  List<Object> get props => [];
}

class SystemConfigsLoaded extends SystemConfigsState {
  const SystemConfigsLoaded({
    required this.genders,
    required this.districts,
    required this.provinces,
    required this.maritalStatuses,
    required this.employmentStatuses,
    required this.relationshipTypes,
  });

  final List<Gender> genders;
  final List<District> districts;
  final List<Province> provinces;
  final List<MaritalStatus> maritalStatuses;
  final List<EmploymentStatus> employmentStatuses;
  final List<RelationshipType> relationshipTypes;

  @override
  List<Object> get props => [];
}

class SystemConfigsError extends SystemConfigsState {
  const SystemConfigsError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
