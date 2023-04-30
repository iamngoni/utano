//
//  dispensary_patient_details_section
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/prescription.dart';

class DispensaryPatientDetailsSection extends StatelessWidget {
  const DispensaryPatientDetailsSection({
    required this.prescription,
    super.key,
  });

  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sx(5),
              ),
              child: Text(
                'Patient [Ngonidzashe Mangudya - MALE - Age [24]]',
                style: TextStyle(
                  color: UtanoColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: sy(12),
                ),
              ),
            ),
            const Divider(
              color: UtanoColors.border,
            ),
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(5),
              ),
              height: sy(50),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Examination Notes',
                          style: TextStyle(
                            color: UtanoColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: sy(11),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              'fjkfjnefkbwfhewikfbc,jfndbefkwdfnbkfbrrwbfwfrkfd'
                              'ffmnfbhjrfbremhfnrwfbwmnwbfmwrnfbwrf',
                              style: TextStyle(
                                color: UtanoColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(11),
                                backgroundColor: UtanoColors.blueGrey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: context.height,
                    margin: EdgeInsets.symmetric(
                      horizontal: sx(5),
                    ),
                    width: sx(0.5),
                    color: UtanoColors.border,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Diagnosis Notes',
                          style: TextStyle(
                            color: UtanoColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: sy(11),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              'fjkfjnefkbwfhewikfbc,jfndbefkwdfnbkfbrrwbfwfrkfd'
                              'ffmnfbhjrfbremhfnrwfbwmnwbfmwrnfbwrf',
                              style: TextStyle(
                                color: UtanoColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(11),
                                backgroundColor: UtanoColors.blueGrey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: context.height,
                    margin: EdgeInsets.symmetric(
                      horizontal: sx(5),
                    ),
                    width: sx(0.5),
                    color: UtanoColors.border,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Patient Allergies',
                          style: TextStyle(
                            color: UtanoColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: sy(11),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: List.generate(
                              7,
                              (index) => Text(
                                '🤧 peanuts',
                                style: TextStyle(
                                  color: UtanoColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: sy(12),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: UtanoColors.border,
            ),
          ],
        );
      },
    );
  }
}
