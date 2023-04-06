//
//  nurse_dashboard
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/views/widgets/dashboard_stats_widget.dart';
import '../../../core/views/widgets/page_header.dart';

class NurseDashboardPage extends StatelessWidget {
  const NurseDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: context.height,
          width: context.width,
          color: UtanoColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: 'Dashboard',
              ),
              SizedBox(
                height: sy(20),
              ),
              const DashboardStatsWidget(),
            ],
          ),
        );
      },
    );
  }
}
