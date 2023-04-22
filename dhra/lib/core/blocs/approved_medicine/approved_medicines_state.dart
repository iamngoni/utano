part of 'approved_medicines_bloc.dart';

abstract class ApprovedMedicinesState extends Equatable {
  const ApprovedMedicinesState();
}

class ApprovedMedicinesInitial extends ApprovedMedicinesState {
  const ApprovedMedicinesInitial();
  @override
  List<Object> get props => [];
}

class ApprovedMedicinesLoading extends ApprovedMedicinesState {
  const ApprovedMedicinesLoading();
  @override
  List<Object> get props => [];
}

class ApprovedMedicinesLoaded extends ApprovedMedicinesState {
  const ApprovedMedicinesLoaded(this.medicines);
  final List<ApprovedMedicine> medicines;
  @override
  List<Object> get props => [ApprovedMedicine];
}

class ApprovedMedicinesError extends ApprovedMedicinesState {
  const ApprovedMedicinesError(this.error);
  final ApplicationError error;
  @override
  List<Object> get props => [error];
}
