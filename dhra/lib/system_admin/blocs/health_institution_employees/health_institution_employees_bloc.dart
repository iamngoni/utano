import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/configs/configs.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/models/data/employee.dart';
import '../../../core/models/data/health_institution.dart';
import '../../models/repos/abstract/system_admin_repository.dart';

part 'health_institution_employees_event.dart';
part 'health_institution_employees_state.dart';

class HealthInstitutionEmployeesBloc extends Bloc<
    HealthInstitutionEmployeesEvent, HealthInstitutionEmployeesState> {
  HealthInstitutionEmployeesBloc({required this.repository})
      : super(const HealthInstitutionEmployeesInitial()) {
    on<ListHealthInstitutionEmployees>((event, emit) async {
      emit(const HealthInstitutionEmployeesLoading());
      try {
        final Either<ApplicationError, List<Employee>> response =
            await repository
                .listHealthInstitutionEmployees(event.healthInstitution.id);
        response.fold(
          (l) => emit(HealthInstitutionEmployeesError(l)),
          (r) => emit(
            HealthInstitutionEmployeesLoaded(event.healthInstitution, r),
          ),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(HealthInstitutionEmployeesError(ApplicationError.unknownError()));
      }
    });
  }

  final SystemAdminRepository repository;
}
