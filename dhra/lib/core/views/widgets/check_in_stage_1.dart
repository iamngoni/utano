//
//  check_in_stage_1
//  dhra
//
//  Created by Ngonidzashe Mangudya on 12/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import 'checkup_details_form.dart';
import 'personal_information_form.dart';
import 'utano_button.dart';

class CheckInStage1 extends StatelessWidget {
  const CheckInStage1({
    required PageController pageController,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController mobileNumberController,
    required TextEditingController addressController,
    required TextEditingController nationalIdNumberController,
    required TextEditingController temperatureController,
    required TextEditingController systolicBloodPressureController,
    required TextEditingController diastolicBloodPressureController,
    required TextEditingController pulseController,
    required TextEditingController respiratoryRateController,
    super.key,
  })  : _firstNameController = firstNameController,
        _lastNameController = lastNameController,
        _mobileNumberController = mobileNumberController,
        _addressController = addressController,
        _nationalIdNumberController = nationalIdNumberController,
        _temperatureController = temperatureController,
        _systolicBloodPressureController = systolicBloodPressureController,
        _diastolicBloodPressureController = diastolicBloodPressureController,
        _pulseController = pulseController,
        _respiratoryRateController = respiratoryRateController,
        _pageController = pageController;

  final PageController _pageController;
  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final TextEditingController _mobileNumberController;
  final TextEditingController _addressController;
  final TextEditingController _nationalIdNumberController;
  final TextEditingController _temperatureController;
  final TextEditingController _systolicBloodPressureController;
  final TextEditingController _diastolicBloodPressureController;
  final TextEditingController _pulseController;
  final TextEditingController _respiratoryRateController;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  PersonalInformationForm(
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                    mobileNumberController: _mobileNumberController,
                    addressController: _addressController,
                    nationalIdNumberController: _nationalIdNumberController,
                  ),
                  SizedBox(
                    width: sx(5),
                  ),
                  CheckupDetailsForm(
                    temperatureController: _temperatureController,
                    systolicBloodPressureController:
                        _systolicBloodPressureController,
                    diastolicBloodPressureController:
                        _diastolicBloodPressureController,
                    pulseController: _pulseController,
                    respiratoryRateController: _respiratoryRateController,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sy(10),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: sx(50),
                child: UtanoButton(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  text: 'CONTINUE',
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
