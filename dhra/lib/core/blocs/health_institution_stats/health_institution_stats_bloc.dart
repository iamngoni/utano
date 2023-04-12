import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../configs/configs.dart';
import '../../models/data/application_error.dart';
import '../../models/data/health_institution.dart';
import '../../models/data/stats.dart';
import '../../models/repos/abstract/health_institution_repository.dart';

part 'health_institution_stats_event.dart';
part 'health_institution_stats_state.dart';

class HealthInstitutionStatsBloc extends HydratedBloc<
    HealthInstitutionStatsEvent, HealthInstitutionStatsState> {
  HealthInstitutionStatsBloc({required this.repository})
      : super(const HealthInstitutionStatsInitial()) {
    on<HealthInstitutionStatsEvent>((event, emit) async {
      emit(const HealthInstitutionStatsLoading());
      try {
        final List<Either<ApplicationError, dynamic>> response =
            await Future.wait([
          repository.getInstitutionDetails(),
          repository.getInstitutionStats(),
        ]);

        late HealthInstitution healthInstitution;
        late Stats stats;

        response[0].fold(
          (l) => emit(HealthInstitutionStatsError(l)),
          (r) => healthInstitution = r as HealthInstitution,
        );
        response[1].fold(
          (l) => emit(HealthInstitutionStatsError(l)),
          (r) => stats = r as Stats,
        );
        emit(HealthInstitutionStatsLoaded(healthInstitution, stats));
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(HealthInstitutionStatsError(ApplicationError.unknownError()));
      }
    });
  }

  @override
  HealthInstitutionStatsState? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      final HealthInstitution healthInstitution = HealthInstitution.fromJson(
        json['health_institution'] as Map<String, dynamic>,
      );
      final Stats stats = Stats.fromJson(json['stats'] as Map<String, dynamic>);
      return HealthInstitutionStatsLoaded(healthInstitution, stats);
    }

    return null;
  }

  @override
  Map<String, dynamic>? toJson(HealthInstitutionStatsState state) {
    if (state is HealthInstitutionStatsLoaded) {
      return {
        'stats': state.stats.toJson(),
        'health_institution': state.healthInstitution.toJson(),
      };
    }

    return null;
  }

  final HealthInstitutionRepository repository;
}
