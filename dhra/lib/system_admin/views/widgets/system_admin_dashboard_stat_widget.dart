//
//  dashboard_stat_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../system_admin/blocs/system_stats/system_stats_bloc.dart';

class SystemAdminDashboardStatWidget extends StatelessWidget {
  const SystemAdminDashboardStatWidget({
    required this.title,
    required this.assetImage,
    required this.number,
    this.isLoading = false,
    super.key,
  });

  final String title;
  final AssetImage assetImage;
  final String number;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: () => context.read<SystemStatsBloc>().add(GetStatistics()),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: sx(7),
              vertical: sy(15),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: UtanoColors.border,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: UtanoColors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0.5, 0.5),
                ),
                BoxShadow(
                  color: UtanoColors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(-0.5, -0.5),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: !isLoading
                  ? Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: UtanoColors.inactive.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ImageIcon(
                            assetImage,
                            color: UtanoColors.black,
                          ),
                        ),
                        SizedBox(
                          width: sx(5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: UtanoColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(9),
                              ),
                            ),
                            SizedBox(
                              height: sy(3),
                            ),
                            Text(
                              number,
                              style: TextStyle(
                                color: UtanoColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: sy(12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: sy(13),
                        ),
                        child: const LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
