import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../configs/configs.dart';
import '../../models/data/application_error.dart';
import '../../models/data/check_in_monthly_stats.dart';
import '../../models/data/check_in_yearly_stats.dart';
import '../../models/repos/abstract/health_institution_repository.dart';

part 'check_in_stats_event.dart';
part 'check_in_stats_state.dart';

class CheckInStatsBloc extends Bloc<CheckInStatsEvent, CheckInStatsState> {
  CheckInStatsBloc({required this.repository}) : super(CheckInStatsInitial()) {
    on<LoadCheckInStats>((event, emit) async {
      emit(CheckInStatsLoading());
      try {
        final List<Either<ApplicationError, dynamic>> response =
            await Future.wait([
          repository.getMonthlyCheckInStats(),
          repository.getYearlyCheckInStats()
        ]);
        late List<CheckInMonthlyStats> monthlyStats;
        late List<CheckInYearlyStats> yearlyStats;

        response[0].fold(
          (l) => emit(CheckInStatsError(l)),
          (r) => monthlyStats = r as List<CheckInMonthlyStats>,
        );
        response[1].fold(
          (l) => emit(CheckInStatsError(l)),
          (r) => yearlyStats = r as List<CheckInYearlyStats>,
        );

        emit(
          CheckInStatsLoaded(
            monthlyStats: monthlyStats,
            yearlyStats: yearlyStats,
          ),
        );
      } catch (e, s) {
        logger
          ..e(e)
          ..e(s);
        emit(CheckInStatsError(ApplicationError.unknownError()));
      }
    });
  }

  final HealthInstitutionRepository repository;
}
