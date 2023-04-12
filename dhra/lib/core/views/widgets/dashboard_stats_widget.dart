//
//  dashboard_stats_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/health_institution_stats/health_institution_stats_bloc.dart';
import 'dashboard_stat_widget.dart';

class DashboardStatsWidget extends StatelessWidget {
  const DashboardStatsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return BlocBuilder<HealthInstitutionStatsBloc,
            HealthInstitutionStatsState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: DashboardStatWidget(
                    title: 'Patients',
                    assetImage: const AssetImage('assets/icons/bed-pulse.png'),
                    number: state is HealthInstitutionStatsLoaded
                        ? state.stats.patients.toStringAsFixed(0)
                        : 'n/a',
                    isLoading: state is HealthInstitutionStatsLoading,
                  ),
                ),
                SizedBox(
                  width: sx(3),
                ),
                Expanded(
                  child: DashboardStatWidget(
                    title: 'Employees',
                    assetImage:
                        const AssetImage('assets/icons/people-roof.png'),
                    number: state is HealthInstitutionStatsLoaded
                        ? state.stats.employees.toStringAsFixed(0)
                        : 'n/a',
                    isLoading: state is HealthInstitutionStatsLoading,
                  ),
                ),
                SizedBox(
                  width: sx(3),
                ),
                Expanded(
                  child: DashboardStatWidget(
                    title: 'Doctors',
                    assetImage:
                        const AssetImage('assets/icons/user-doctor.png'),
                    number: state is HealthInstitutionStatsLoaded
                        ? state.stats.doctors.toStringAsFixed(0)
                        : 'n/a',
                    isLoading: state is HealthInstitutionStatsLoading,
                  ),
                ),
                SizedBox(
                  width: sx(3),
                ),
                Expanded(
                  child: DashboardStatWidget(
                    title: 'Nurses',
                    assetImage: const AssetImage('assets/icons/user-nurse.png'),
                    number: state is HealthInstitutionStatsLoaded
                        ? state.stats.nurses.toStringAsFixed(0)
                        : 'n/a',
                    isLoading: state is HealthInstitutionStatsLoading,
                  ),
                ),
                SizedBox(
                  width: sx(3),
                ),
                Expanded(
                  child: DashboardStatWidget(
                    title: 'Rooms',
                    assetImage:
                        const AssetImage('assets/icons/person-booth.png'),
                    number: state is HealthInstitutionStatsLoaded
                        ? state.stats.rooms.toStringAsFixed(0)
                        : 'n/a',
                    isLoading: state is HealthInstitutionStatsLoading,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
