//
//  check_in_stats_chart
//  dhra
//
//  Created by Ngonidzashe Mangudya on 9/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/check_in_stats/check_in_stats_bloc.dart';
import '../../blocs/dropdown_button/dropdown_button_bloc.dart';
import '../../configs/colors.dart';
import '../../models/data/check_in_monthly_stats.dart';
import '../../models/data/check_in_stats_option.dart';
import '../../models/data/check_in_yearly_stats.dart';
import 'utano_dropdown_button.dart';

class CheckInStatsChart extends StatefulWidget {
  const CheckInStatsChart({
    required this.monthlyStats,
    required this.yearlyStats,
    super.key,
  });

  final List<CheckInMonthlyStats> monthlyStats;
  final List<CheckInYearlyStats> yearlyStats;

  @override
  State<CheckInStatsChart> createState() => _CheckInStatsChartState();
}

class _CheckInStatsChartState extends State<CheckInStatsChart> {
  CheckInStatsOption option = CheckInStatsOption.monthly;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Patient Statistics',
                  style: TextStyle(
                    color: UtanoColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: sy(12),
                  ),
                ),
                Row(
                  children: [
                    BlocProvider<DropdownButtonBloc<CheckInStatsOption>>(
                      create: (context) =>
                          DropdownButtonBloc<CheckInStatsOption>(),
                      child: Builder(
                        builder: (context) {
                          return SizedBox(
                            height: sy(30),
                            width: sx(60),
                            child: UtanoDropdownButton<CheckInStatsOption>(
                              title: 'Select a period',
                              items: CheckInStatsOption.values,
                              onChanged: (CheckInStatsOption? option) {
                                setState(() {
                                  this.option = option!;
                                });
                              },
                              value: option,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: sx(5),
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<CheckInStatsBloc>()
                          .add(const LoadCheckInStats()),
                      child: Icon(
                        CupertinoIcons.refresh_thick,
                        color: UtanoColors.grey,
                        size: sy(15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: sy(20),
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    if (option == CheckInStatsOption.monthly)
                      LineChartBarData(
                        spots: widget.monthlyStats
                            .map(
                              (stat) => FlSpot(
                                stat.day.day.toDouble(),
                                stat.count.toDouble(),
                              ),
                            )
                            .toList(),
                        isCurved: false,
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                        ),
                        shadow: const Shadow(
                          blurRadius: 5,
                          color: UtanoColors.grey,
                        ),
                      )
                    else
                      LineChartBarData(
                        spots: widget.yearlyStats
                            .map(
                              (stat) => FlSpot(
                                stat.month.month.toDouble(),
                                stat.count.toDouble(),
                              ),
                            )
                            .toList(),
                        isCurved: true,
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                        ),
                        shadow: const Shadow(
                          blurRadius: 5,
                          color: UtanoColors.grey,
                        ),
                      ),
                  ],
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      axisNameWidget: Text(
                        '',
                        style: TextStyle(
                          color: UtanoColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(12),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text(
                        option == CheckInStatsOption.monthly
                            ? 'Day of the month (${DateTime.now().getMonth})'
                            : 'Month of the year (${DateTime.now().year})',
                        style: TextStyle(
                          color: UtanoColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(12),
                        ),
                      ),
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        reservedSize: sy(20),
                        getTitlesWidget: (value, _) {
                          if (option == CheckInStatsOption.monthly) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                color: UtanoColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(10),
                              ),
                            );
                          } else {
                            return Text(
                              [
                                'Jan',
                                'Feb',
                                'Mar',
                                'Apr',
                                'May',
                                'Jun',
                                'Jul',
                                'Aug',
                                'Sep',
                                'Oct',
                                'Nov',
                                'Dec'
                              ].elementAt(value.toInt() - 1),
                              style: TextStyle(
                                color: UtanoColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(10),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      axisNameWidget: Text(
                        'Number of check ins',
                        style: TextStyle(
                          color: UtanoColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(12),
                        ),
                      ),
                      axisNameSize: sx(20),
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 2,
                        reservedSize: sx(10),
                        getTitlesWidget: (value, _) {
                          return Text(
                            value.toInt().toString(),
                            style: TextStyle(
                              color: UtanoColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(10),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  backgroundColor: UtanoColors.white,
                  borderData: FlBorderData(
                    show: true,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
