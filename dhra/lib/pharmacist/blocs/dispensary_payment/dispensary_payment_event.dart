part of 'dispensary_payment_bloc.dart';

abstract class DispensaryPaymentEvent extends Equatable {
  const DispensaryPaymentEvent();
}

class ResetDispensaryPayment extends DispensaryPaymentEvent {
  @override
  List<Object> get props => [];
}

class PayForDispensaryItems extends DispensaryPaymentEvent {
  const PayForDispensaryItems(
    this.dispense,
    this.paymentMethod, {
    this.mobileNumber,
  });
  final Dispense dispense;
  final PaymentMethod paymentMethod;
  final String? mobileNumber;

  @override
  List<Object?> get props => [dispense, paymentMethod, mobileNumber];
}
