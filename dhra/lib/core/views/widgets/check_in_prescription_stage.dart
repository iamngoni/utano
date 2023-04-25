//
//  check_in_prescription_stage.dart
//  dhra
//
//  Created by Ngonidzashe Mangudya on 21/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/point_of_service/point_of_service_bloc.dart';
import '../../configs/colors.dart';
import 'point_of_service_prescription_point.dart';
import 'utano_button.dart';

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
              padding: EdgeInsets.symmetric(
                horizontal: sx(10),
                vertical: sy(10),
              ),
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
              child: BlocBuilder<PointOfServiceBloc, PointOfServiceState>(
                builder: (context, state) {
                  if (state is PointOfServiceIdle) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current Patient',
                          style: TextStyle(
                            color: UtanoColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(12),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${state.checkIn?.patient.user.firstName}'
                              ' ${state.checkIn?.patient.user.lastName}',
                              style: TextStyle(
                                color: UtanoColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: sy(12),
                              ),
                            ),
                            Text(
                              '${state.checkIn?.patient.age} Years Old,'
                              ' ${state.checkIn?.patient.user.gender?.titleCase}',
                              style: TextStyle(
                                color: UtanoColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('No patient information found. Reenter information'),
                      UtanoButton(
                        text: 'Go back',
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: sy(15),
            ),
            const Expanded(child: PointOfServicePrescriptionPoint()),
          ],
        );
      },
    );
  }
}
