part of 'point_of_service_bloc.dart';

abstract class PointOfServiceState extends Equatable {
  const PointOfServiceState();
}

class PointOfServiceIdle extends PointOfServiceState {
  const PointOfServiceIdle({this.checkIn, this.prescription});

  final CheckIn? checkIn;
  final Prescription? prescription;
  @override
  List<Object?> get props => [checkIn];
}

class PointOfServiceLoading extends PointOfServiceState {
  const PointOfServiceLoading();

  @override
  List<Object> get props => [];
}

class PointOfServiceError extends PointOfServiceState {
  const PointOfServiceError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
