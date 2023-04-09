//
//  admin_home
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/blocs/check_in_stats/check_in_stats_bloc.dart';
import '../../../core/configs/colors.dart';
import '../../../core/views/widgets/check_in_stats_chart.dart';
import '../../../core/views/widgets/dashboard_stats_widget.dart';
import '../../../core/views/widgets/exception_widget.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/page_header.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: context.height,
          width: context.width,
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
              SizedBox(
                height: sy(20),
              ),
              Expanded(
                child: Container(
                  height: context.height,
                  width: context.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: sx(10),
                    vertical: sy(20),
                  ),
                  decoration: BoxDecoration(
                    color: UtanoColors.white,
                    border:
                        Border.all(color: UtanoColors.border.withOpacity(0.4)),
                    boxShadow: [
                      BoxShadow(
                        color: UtanoColors.grey.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0.5, 0.5),
                      ),
                      BoxShadow(
                        color: UtanoColors.grey.withOpacity(0.07),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(-0.5, -0.5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: BlocBuilder<CheckInStatsBloc, CheckInStatsState>(
                    builder: (context, state) {
                      late Widget child;

                      if (state is CheckInStatsLoading) {
                        child = const Center(
                          child: LoaderWidget(
                            color: UtanoColors.black,
                          ),
                        );
                      } else if (state is CheckInStatsError) {
                        child = ExceptionWidget(
                          error: state.error,
                          onRetry: () => context.read<CheckInStatsBloc>().add(
                                const LoadCheckInStats(),
                              ),
                        );
                      } else if (state is CheckInStatsLoaded) {
                        child = CheckInStatsChart(
                          monthlyStats: state.monthlyStats,
                          yearlyStats: state.yearlyStats,
                        );
                      } else {
                        child = Center(
                          child: GestureDetector(
                            onTap: () => context.read<CheckInStatsBloc>().add(
                                  const LoadCheckInStats(),
                                ),
                            child: const Icon(
                              CupertinoIcons.refresh_thick,
                              color: UtanoColors.black,
                            ),
                          ),
                        );
                      }

                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: child,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
