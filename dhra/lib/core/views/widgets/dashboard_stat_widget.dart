//
//  dashboard_stat_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class DashboardStatWidget extends StatelessWidget {
  const DashboardStatWidget({
    required this.title,
    required this.assetImage,
    required this.number,
    super.key,
  });

  final String title;
  final AssetImage assetImage;
  final double number;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sx(7),
            vertical: sy(10),
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
                offset: const Offset(1, 1),
              ),
              BoxShadow(
                color: UtanoColors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(-1, -1),
              ),
            ],
          ),
          child: Row(
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: UtanoColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(8),
                    ),
                  ),
                  SizedBox(
                    height: sy(3),
                  ),
                  Text(
                    number.toStringAsFixed(0),
                    style: TextStyle(
                      color: UtanoColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: sy(10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
