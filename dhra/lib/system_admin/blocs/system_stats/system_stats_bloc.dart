import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../core/configs/configs.dart';
import '../../../core/models/data/application_error.dart';
import '../../models/data/system_stats.dart';
import '../../models/repos/abstract/system_admin_repository.dart';

part 'system_stats_event.dart';
part 'system_stats_state.dart';

class SystemStatsBloc extends HydratedBloc<SystemStatsEvent, SystemStatsState> {
  SystemStatsBloc({required this.repository})
      : super(const SystemStatsInitial()) {
    on<GetStatistics>((event, emit) async {
      emit(const SystemStatsLoading());
      try {
        final Either<ApplicationError, SystemStats> response =
            await repository.getSystemStats();
        response.fold(
          (l) => emit(SystemStatsError(l)),
          (r) => emit(SystemStatsLoaded(r)),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(SystemStatsError(ApplicationError.unknownError()));
      }
    });
  }

  @override
  SystemStatsState? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      final SystemStats stats = SystemStats.fromJson(json);
      return SystemStatsLoaded(stats);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(SystemStatsState state) {
    if (state is SystemStatsLoaded) {
      return state.stats.toJson();
    }

    return null;
  }

  final SystemAdminRepository repository;
}
