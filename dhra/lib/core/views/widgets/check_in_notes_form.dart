//
//  check_in_notes_form
//  dhra
//
//  Created by Ngonidzashe Mangudya on 12/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dhra/core/views/widgets/utano_text_field.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class CheckInNotesForm extends StatelessWidget {
  const CheckInNotesForm({
    required TextEditingController patientNotesController,
    required TextEditingController examinationNotesController,
    required TextEditingController diagnosisNotesController,
    super.key,
  })  : _patientNotesController = patientNotesController,
        _examinationNotesController = examinationNotesController,
        _diagnosisNotesController = diagnosisNotesController;

  final TextEditingController _patientNotesController;
  final TextEditingController _examinationNotesController;
  final TextEditingController _diagnosisNotesController;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Expanded(
          child: Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notes',
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
                  controller: _patientNotesController,
                  label: 'Patient Notes',
                  placeholder: 'What the patient is saying',
                  maxLines: 4,
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: _examinationNotesController,
                  label: 'Examination Notes',
                  placeholder: "What you've observed during the examination",
                  maxLines: 3,
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: _diagnosisNotesController,
                  label: 'Diagnosis Notes',
                  placeholder: 'Possible Diagnosis and the reason why',
                  maxLines: 4,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
