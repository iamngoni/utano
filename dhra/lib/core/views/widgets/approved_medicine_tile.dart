//
//  approved_medicine_tile
//  dhra
//
//  Created by Ngonidzashe Mangudya on 23/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';
import '../../models/data/approved_medicine.dart';

class ApprovedMedicineTile extends StatelessWidget {
  const ApprovedMedicineTile({
    required this.medicine,
    required this.color,
    required this.prescribeMedication,
    super.key,
  });

  final ApprovedMedicine medicine;
  final Color color;
  final void Function(ApprovedMedicine medicine) prescribeMedication;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sx(5),
            vertical: sy(5),
          ),
          decoration: BoxDecoration(
            color: color,
          ),
          child: MacosListTile(
            onClick: () => prescribeMedication(medicine),
            leading: const Text('💊'),
            title: Text(
              medicine.name.headingCase,
              style: TextStyle(
                color: UtanoColors.black,
                fontWeight: FontWeight.w400,
                fontSize: sy(12),
              ),
            ),
            subtitle: Text(
              medicine.description,
              style: TextStyle(
                color: UtanoColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: sy(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
