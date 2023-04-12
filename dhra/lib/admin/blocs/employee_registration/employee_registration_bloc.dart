import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/configs/configs.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/models/data/gender.dart';
import '../../../core/models/data/user_role.dart';
import '../../../core/models/repos/abstract/health_institution_repository.dart';

part 'employee_registration_event.dart';
part 'employee_registration_state.dart';

class EmployeeRegistrationBloc
    extends Bloc<EmployeeRegistrationEvent, EmployeeRegistrationState> {
  EmployeeRegistrationBloc({required this.repository})
      : super(const EmployeeRegistrationInitial()) {
    on<RegisterEmployee>((event, emit) async {
      emit(const EmployeeRegistrationLoading());
      try {
        final Either<ApplicationError, bool> response =
            await repository.createEmployee(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          role: event.role,
          gender: event.gender,
        );
        response.fold(
          (l) => emit(EmployeeRegistrationError(l)),
          (r) => emit(const EmployeeRegistrationInitial()),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(EmployeeRegistrationError(ApplicationError.unknownError()));
      }
    });
    on<ResetRegistrationForm>((event, emit) {
      emit(const EmployeeRegistrationInitial(reset: true));
    });
  }

  final HealthInstitutionRepository repository;
}
