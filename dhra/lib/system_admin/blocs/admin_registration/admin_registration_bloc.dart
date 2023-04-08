import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/configs/configs.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/models/data/employee.dart';
import '../../../core/models/data/gender.dart';
import '../../../core/models/data/health_institution.dart';
import '../../../core/models/data/user_role.dart';
import '../../../core/models/repos/abstract/health_institution_repository.dart';
import '../../models/repos/abstract/system_admin_repository.dart';
import '../../views/pages/system_admin_app.dart';

part 'admin_registration_event.dart';
part 'admin_registration_state.dart';

class AdminRegistrationBloc
    extends Bloc<AdminRegistrationEvent, AdminRegistrationState> {
  AdminRegistrationBloc({required this.repository})
      : super(const AdminRegistrationInitial()) {
    on<RegisterAdmin>((event, emit) async {
      emit(const AdminRegistrationLoading());
      try {
        final Either<ApplicationError, Employee> response =
            await repository.registerHealthInstitutionAdmin(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          healthInstitutionId: event.healthInstitution.id,
          gender: event.gender,
        );
        response.fold(
          (l) => emit(AdminRegistrationError(l)),
          (r) => emit(const AdminRegistrationInitial()),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(AdminRegistrationError(ApplicationError.unknownError()));
      }
    });
    on<ResetRegistrationForm>((event, emit) {
      emit(const AdminRegistrationInitial(reset: true));
    });
  }

  final SystemAdminRepository repository;
}
