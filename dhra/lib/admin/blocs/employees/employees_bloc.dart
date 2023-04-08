import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/configs/configs.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/models/data/employee.dart';
import '../../../core/models/repos/abstract/health_institution_repository.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeesBloc({required this.repository}) : super(EmployeesInitial()) {
    on<ListEmployees>((event, emit) async {
      emit(EmployeesLoading());
      try {
        final Either<ApplicationError, List<Employee>> response =
            await repository.listEmployees();
        response.fold(
          (l) => emit(EmployeesError(l)),
          (r) => emit(EmployeesLoaded(r)),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(EmployeesError(ApplicationError.unknownError()));
      }
    });
  }

  final HealthInstitutionRepository repository;
}
