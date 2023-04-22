//
//  check_in_prescription_stage.dart
//  dhra
//
//  Created by Ngonidzashe Mangudya on 21/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class CheckInPrescriptionStage extends StatelessWidget {
  const CheckInPrescriptionStage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          children: [
            Container(
              width: context.width,
              decoration: BoxDecoration(
                color: UtanoColors.white,
                border: Border.all(
                  color: UtanoColors.border.withOpacity(0.4),
                ),
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
            ),
          ],
        );
      },
    );
  }
}
