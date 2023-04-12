//
//  check_in_stage_2
//  dhra
//
//  Created by Ngonidzashe Mangudya on 12/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import 'check_in_notes_form.dart';
import 'conclusion_notes_form.dart';
import 'utano_button.dart';

class CheckInStage2 extends StatelessWidget {
  const CheckInStage2({
    required TextEditingController patientNotesController,
    required TextEditingController examinationNotesController,
    required TextEditingController diagnosisNotesController,
    required TextEditingController treatmentNotesController,
    required PageController pageController,
    super.key,
  })  : _patientNotesController = patientNotesController,
        _examinationNotesController = examinationNotesController,
        _diagnosisNotesController = diagnosisNotesController,
        _treatmentNotesController = treatmentNotesController,
        _pageController = pageController;

  final TextEditingController _patientNotesController;
  final TextEditingController _examinationNotesController;
  final TextEditingController _diagnosisNotesController;
  final TextEditingController _treatmentNotesController;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  CheckInNotesForm(
                    patientNotesController: _patientNotesController,
                    examinationNotesController: _examinationNotesController,
                    diagnosisNotesController: _diagnosisNotesController,
                  ),
                  SizedBox(
                    width: sx(5),
                  ),
                  ConclusionNotesForm(
                    treatmentNotesController: _treatmentNotesController,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sy(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: sx(50),
                  child: UtanoButton(
                    onTap: () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    text: 'BACK',
                  ),
                ),
                SizedBox(
                  width: sx(50),
                  child: const UtanoButton(
                    text: 'CONTINUE',
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
