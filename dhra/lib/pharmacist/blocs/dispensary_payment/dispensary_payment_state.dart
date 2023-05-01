part of 'dispensary_payment_bloc.dart';

abstract class DispensaryPaymentState extends Equatable {
  const DispensaryPaymentState();
}

class DispensaryPaymentInitial extends DispensaryPaymentState {
  @override
  List<Object> get props => [];
}

class DispensaryPaymentLoading extends DispensaryPaymentState {
  @override
  List<Object> get props => [];
}

class DispensaryPaymentLoaded extends DispensaryPaymentState {
  const DispensaryPaymentLoaded(this.payment);
  final Payment payment;

  @override
  List<Object> get props => [payment];
}

class DispensaryPaymentError extends DispensaryPaymentState {
  const DispensaryPaymentError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
