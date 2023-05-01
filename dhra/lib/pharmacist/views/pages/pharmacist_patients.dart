//
//  pharmacist_patients
//  dhra
//
//  Created by Ngonidzashe Mangudya on 25/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/views/widgets/page_header.dart';
import '../../../core/views/widgets/patients_table.dart';

class PharmacistPatientsPage extends StatelessWidget {
  const PharmacistPatientsPage({super.key});

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
                title: 'Patients',
              ),
              SizedBox(
                height: sy(20),
              ),
              const Expanded(
                child: PatientsTable(),
              ),
            ],
          ),
        );
      },
    );
  }
}