import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/configs/configs.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/models/data/dispense.dart';
import '../../../core/models/data/payment.dart';
import '../../../core/models/data/payment_method.dart';
import '../../../core/models/repos/abstract/health_institution_repository.dart';

part 'dispensary_payment_event.dart';
part 'dispensary_payment_state.dart';

class DispensaryPaymentBloc
    extends Bloc<DispensaryPaymentEvent, DispensaryPaymentState> {
  DispensaryPaymentBloc({required this.repository})
      : super(DispensaryPaymentInitial()) {
    on<ResetDispensaryPayment>((event, emit) {
      emit(DispensaryPaymentInitial());
    });
    on<PayForDispensaryItems>((event, emit) async {
      emit(DispensaryPaymentLoading());
      try {
        final Either<ApplicationError, Payment> response =
            await repository.dispensaryPayment(
          event.dispense,
          event.paymentMethod,
          event.mobileNumber,
        );
        response.fold(
          (l) => emit(DispensaryPaymentError(l)),
          (r) => emit(DispensaryPaymentLoaded(r)),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
      }
    });
  }

  final HealthInstitutionRepository repository;
}
