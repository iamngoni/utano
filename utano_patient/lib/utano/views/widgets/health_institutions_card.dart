//
//  health_institutions_card
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 4/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:handy_extensions/handy_extensions.dart';

import '../../../core/configs/colors.dart';

class HealthInstitutionsCard extends StatelessWidget {
  const HealthInstitutionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: context.width,
          height: sy(100),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                UtanoColors.info,
                UtanoColors.info.withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: sx(20),
                  bottom: sy(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Institutions',
                      style: TextStyle(
                        color: UtanoColors.light,
                        fontWeight: FontWeight.w600,
                        fontSize: sy(11),
                      ),
                    ),
                    Text(
                      'List of Health Institutions',
                      style: TextStyle(
                        color: UtanoColors.light.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: sy(9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
