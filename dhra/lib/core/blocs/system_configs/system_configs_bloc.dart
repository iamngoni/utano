import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../configs/configs.dart';
import '../../models/data/application_error.dart';
import '../../models/data/district.dart';
import '../../models/data/employment_status.dart';
import '../../models/data/gender.dart';
import '../../models/data/marital_status.dart';
import '../../models/data/province.dart';
import '../../models/data/relationship_type.dart';
import '../../models/repos/abstract/system_configs_repository.dart';

part 'system_configs_event.dart';
part 'system_configs_state.dart';

class SystemConfigsBloc
    extends HydratedBloc<SystemConfigsEvent, SystemConfigsState> {
  SystemConfigsBloc({required this.repository})
      : super(SystemConfigsInitial()) {
    on<LoadSystemConfigs>((event, emit) async {
      try {
        emit(SystemConfigsLoading());
        final List<Either<ApplicationError, dynamic>> futures =
            await Future.wait([
          repository.getDistricts(),
          repository.getProvinces(),
          repository.getEmploymentStatuses(),
          repository.getGender(),
          repository.getRelationshipTypes(),
          repository.getMaritalStatuses(),
        ]);

        late List<District> districts;
        late List<Province> provinces;
        late List<EmploymentStatus> employmentStatuses;
        late List<Gender> genders;
        late List<RelationshipType> relationshipTypes;
        late List<MaritalStatus> maritalStatuses;

        futures[0].fold(
          (l) => emit(SystemConfigsError(l)),
          (r) => districts = r as List<District>,
        );
        futures[1].fold(
          (l) => emit(SystemConfigsError(l)),
          (r) => provinces = r as List<Province>,
        );
        futures[2].fold(
          (l) => emit(SystemConfigsError(l)),
          (r) => employmentStatuses = r as List<EmploymentStatus>,
        );
        futures[3].fold(
          (l) => emit(SystemConfigsError(l)),
          (r) => genders = r as List<Gender>,
        );
        futures[4].fold(
          (l) => emit(SystemConfigsError(l)),
          (r) => relationshipTypes = r as List<RelationshipType>,
        );
        futures[5].fold(
          (l) => emit(SystemConfigsError(l)),
          (r) => maritalStatuses = r as List<MaritalStatus>,
        );

        emit(
          SystemConfigsLoaded(
            genders: genders,
            districts: districts,
            provinces: provinces,
            maritalStatuses: maritalStatuses,
            employmentStatuses: employmentStatuses,
            relationshipTypes: relationshipTypes,
          ),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(SystemConfigsError(ApplicationError.unknownError()));
      }
    });
  }

  @override
  SystemConfigsState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(SystemConfigsState state) {
    if (state is SystemConfigsLoaded) {
      final Map<String, dynamic> toJsonData = {
        'provinces': state.provinces.map((e) => e.toJson()).toList(),
        'districts': state.districts.map((e) => e.toJson()).toList(),
        'relationship_statuses':
            state.relationshipTypes.map((e) => e.toJson()).toList(),
        'employment_statuses':
            state.employmentStatuses.map((e) => e.toJson()).toList(),
        'marital_statuses':
            state.maritalStatuses.map((e) => e.toJson()).toList(),
        'genders': state.genders.map((e) => e.toJson()).toList(),
      };

      logger.i('Saving JSON: $toJsonData');

      return toJsonData;
    } else {
      return null;
    }
  }

  final SystemConfigsRepository repository;
}
