//
//  dashboard_stats_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import 'dashboard_stat_widget.dart';

class DashboardStatsWidget extends StatelessWidget {
  const DashboardStatsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Row(
          children: [
            const Expanded(
              child: DashboardStatWidget(
                title: 'Health Institutions',
                assetImage: AssetImage('assets/icons/user-add.png'),
                number: 1250,
              ),
            ),
            SizedBox(
              width: sx(3),
            ),
            const Expanded(
              child: DashboardStatWidget(
                title: 'Employees',
                assetImage: AssetImage('assets/icons/user-add.png'),
                number: 500,
              ),
            ),
            SizedBox(
              width: sx(3),
            ),
            const Expanded(
              child: DashboardStatWidget(
                title: 'Patients',
                assetImage: AssetImage('assets/icons/user-add.png'),
                number: 58,
              ),
            ),
            SizedBox(
              width: sx(3),
            ),
            const Expanded(
              child: DashboardStatWidget(
                title: 'Total Doctors',
                assetImage: AssetImage('assets/icons/user-add.png'),
                number: 5,
              ),
            ),
          ],
        );
      },
    );
  }
}
