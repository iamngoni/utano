//
//  checkup_details_form
//  dhra
//
//  Created by Ngonidzashe Mangudya on 12/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';
import 'utano_text_field.dart';

class CheckupDetailsForm extends StatefulWidget {
  const CheckupDetailsForm({
    required TextEditingController temperatureController,
    required TextEditingController systolicBloodPressureController,
    required TextEditingController diastolicBloodPressureController,
    required TextEditingController pulseController,
    required TextEditingController respiratoryRateController,
    super.key,
  })  : _temperatureController = temperatureController,
        _systolicBloodPressureController = systolicBloodPressureController,
        _diastolicBloodPressureController = diastolicBloodPressureController,
        _pulseController = pulseController,
        _respiratoryRateController = respiratoryRateController;

  final TextEditingController _temperatureController;
  final TextEditingController _systolicBloodPressureController;
  final TextEditingController _diastolicBloodPressureController;
  final TextEditingController _pulseController;
  final TextEditingController _respiratoryRateController;

  @override
  State<CheckupDetailsForm> createState() => _CheckupDetailsFormState();
}

class _CheckupDetailsFormState extends State<CheckupDetailsForm> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(10),
              vertical: sy(20),
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
            child: ListView(
              controller: _scrollController,
              children: [
                Text(
                  'Checkup Details',
                  style: TextStyle(
                    color: UtanoColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: sy(12),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._temperatureController,
                  label: 'Temperature',
                  placeholder: '37',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._systolicBloodPressureController,
                  label: 'Systolic Blood Pressure',
                  placeholder: '120',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._diastolicBloodPressureController,
                  label: 'Diastolic Blood Pressure',
                  placeholder: '80',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._pulseController,
                  label: 'Pulse',
                  placeholder: '80',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._respiratoryRateController,
                  label: 'Respiratory Rate',
                  placeholder: '20',
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
