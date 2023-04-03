//
//  dashboard_stats_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';

import 'dashboard_stat_widget.dart';

class DashboardStatsWidget extends StatelessWidget {
  const DashboardStatsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        DashboardStatWidget(
          title: 'Total Patients',
          assetImage: AssetImage('assets/icons/user-add.png'),
          number: 1250,
        ),
        DashboardStatWidget(
          title: 'Total Rooms',
          assetImage: AssetImage('assets/icons/user-add.png'),
          number: 500,
        ),
        DashboardStatWidget(
          title: 'Total Staff',
          assetImage: AssetImage('assets/icons/user-add.png'),
          number: 58,
        ),
        DashboardStatWidget(
          title: 'Total Doctors',
          assetImage: AssetImage('assets/icons/user-add.png'),
          number: 5,
        ),
      ],
    );
  }
}
