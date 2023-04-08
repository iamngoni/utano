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

import '../../../system_admin/blocs/system_stats/system_stats_bloc.dart';
import 'dashboard_stat_widget.dart';

class DashboardStatsWidget extends StatelessWidget {
  const DashboardStatsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return BlocBuilder<SystemStatsBloc, SystemStatsState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: DashboardStatWidget(
                    title: 'Health Institutions',
                    assetImage: const AssetImage('assets/icons/user-add.png'),
                    number: state is SystemStatsLoaded
                        ? state.stats.healthInstitutions.toStringAsFixed(0)
                        : 'n/a',
                    isLoading: state is SystemStatsLoading,
                  ),
                ),
                SizedBox(
                  width: sx(3),
                ),
                Expanded(
                  child: DashboardStatWidget(
                    title: 'Employees',
                    assetImage: const AssetImage('assets/icons/user-add.png'),
                    number: state is SystemStatsLoaded
                        ? state.stats.employees.toStringAsFixed(0)
                        : 'n/a',
                    isLoading: state is SystemStatsLoading,
                  ),
                ),
                SizedBox(
                  width: sx(3),
                ),
                Expanded(
                  child: DashboardStatWidget(
                    title: 'Patients',
                    assetImage: const AssetImage('assets/icons/user-add.png'),
                    number: state is SystemStatsLoaded
                        ? state.stats.patients.toStringAsFixed(0)
                        : 'n/a',
                    isLoading: state is SystemStatsLoading,
                  ),
                ),
                SizedBox(
                  width: sx(3),
                ),
                Expanded(
                  child: DashboardStatWidget(
                    title: 'To Be Decided',
                    assetImage: const AssetImage('assets/icons/user-add.png'),
                    number: 'n/a',
                    isLoading: state is SystemStatsLoading,
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
