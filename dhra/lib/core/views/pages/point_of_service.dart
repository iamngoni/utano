//
//  point_of_service
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../widgets/check_in_stage_1.dart';
import '../widgets/check_in_stage_2.dart';
import '../widgets/page_header.dart';

class PointOfServicePage extends StatelessWidget {
  PointOfServicePage({super.key});

  final PageController _pageController = PageController();

  // Personal Details
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _mobileNumberController = TextEditingController();

  final TextEditingController _nationalIdNumberController =
      TextEditingController();

  // Checkup Details
  final TextEditingController _temperatureController = TextEditingController();

  final TextEditingController _systolicBloodPressureController =
      TextEditingController();

  final TextEditingController _diastolicBloodPressureController =
      TextEditingController();

  final TextEditingController _pulseController = TextEditingController();

  final TextEditingController _respiratoryRateController =
      TextEditingController();

  // Checkup Notes
  final TextEditingController _patientNotesController = TextEditingController();

  final TextEditingController _examinationNotesController =
      TextEditingController();

  final TextEditingController _diagnosisNotesController =
      TextEditingController();

  final TextEditingController _treatmentNotesController =
      TextEditingController();

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
                title: 'Point of Service',
              ),
              SizedBox(
                height: sy(20),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CheckInStage1(
                      pageController: _pageController,
                      firstNameController: _firstNameController,
                      lastNameController: _lastNameController,
                      mobileNumberController: _mobileNumberController,
                      addressController: _addressController,
                      nationalIdNumberController: _nationalIdNumberController,
                      temperatureController: _temperatureController,
                      systolicBloodPressureController:
                          _systolicBloodPressureController,
                      diastolicBloodPressureController:
                          _diastolicBloodPressureController,
                      pulseController: _pulseController,
                      respiratoryRateController: _respiratoryRateController,
                    ),
                    CheckInStage2(
                      patientNotesController: _patientNotesController,
                      examinationNotesController: _examinationNotesController,
                      diagnosisNotesController: _diagnosisNotesController,
                      treatmentNotesController: _treatmentNotesController,
                      pageController: _pageController,
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
