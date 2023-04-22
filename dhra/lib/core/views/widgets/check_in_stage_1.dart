//
//  check_in_stage_1
//  dhra
//
//  Created by Ngonidzashe Mangudya on 12/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:localregex/localregex.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../models/data/gender.dart';
import '../../services/di.dart';
import '../../services/notifications.dart';
import '../../utils/typedefs.dart';
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
    required TextEditingController ageController,
    required OnUpdateGender onUpdateGender,
    required OnUpdateUseAge onUpdateUseAge,
    required OnUpdateDateOfBirth onUpdateDateOfBirth,
    required bool useAge,
    required Gender? gender,
    required DateTime? dateOfBirth,
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
        _ageController = ageController,
        _gender = gender,
        _useAge = useAge,
        _dateOfBirth = dateOfBirth,
        _onUpdateUseAge = onUpdateUseAge,
        _onUpdateGender = onUpdateGender,
        _pageController = pageController,
        _onUpdateDateOfBirth = onUpdateDateOfBirth;

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
  final TextEditingController _ageController;
  final Gender? _gender;
  final bool _useAge;
  final DateTime? _dateOfBirth;
  final OnUpdateGender _onUpdateGender;
  final OnUpdateUseAge _onUpdateUseAge;
  final OnUpdateDateOfBirth _onUpdateDateOfBirth;

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
                    ageController: _ageController,
                    gender: _gender,
                    onUpdateGender: _onUpdateGender,
                    useAge: _useAge,
                    onUpdateUseAge: _onUpdateUseAge,
                    dateOfBirth: _dateOfBirth,
                    onUpdateDateOfBirth: _onUpdateDateOfBirth,
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
                    // validate controllers
                    final bool emptyController = [
                      _firstNameController,
                      _lastNameController,
                      _mobileNumberController,
                      _nationalIdNumberController,
                      _temperatureController,
                      _systolicBloodPressureController,
                      _diastolicBloodPressureController,
                      _pulseController,
                      _respiratoryRateController,
                    ].any((controller) => controller.text.isEmpty);

                    if (emptyController) {
                      di<NotificationsService>().showErrorNotification(
                        title: 'Missing fields',
                        message: 'Fill all the required details!',
                      );
                      return;
                    }

                    if (!LocalRegex.isZimID(_nationalIdNumberController.text)) {
                      di<NotificationsService>().showErrorNotification(
                        title: 'Invalid Format',
                        message: 'National ID is invalid',
                      );
                      return;
                    }

                    if (!LocalRegex.isZimMobile(_mobileNumberController.text)) {
                      di<NotificationsService>().showErrorNotification(
                        title: 'Invalid Format',
                        message: 'Mobile is invalid',
                      );
                      return;
                    }

                    final bool notNumeric = [
                      _temperatureController,
                      _systolicBloodPressureController,
                      _diastolicBloodPressureController,
                      _pulseController,
                      _respiratoryRateController,
                    ].any((controller) => !controller.text.isNumeric);

                    if (notNumeric) {
                      di<NotificationsService>().showErrorNotification(
                        title: 'Invalid Format',
                        message: 'Use numeric figures for readings',
                      );
                      return;
                    }

                    if (_gender == null) {
                      di<NotificationsService>().showErrorNotification(
                        title: 'Missing field',
                        message: 'Select gender!',
                      );
                      return;
                    }

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
