//
//  prescription_details_section
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
import '../../../core/models/data/prescription_item.dart';
import 'prescription_item_tile.dart';

class PrescriptionDetailsSection extends StatelessWidget {
  const PrescriptionDetailsSection({
    required this.prescription,
    required this.onSelected,
    super.key,
  });

  final Prescription prescription;
  final void Function(PrescriptionItem) onSelected;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: context.height,
          width: sx(120),
          child: Column(
            children: [
              Text(
                'Prescription '
                '#${prescription.prescriptionNumber}',
                style: TextStyle(
                  color: UtanoColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: sy(12),
                ),
              ),
              const Divider(
                color: UtanoColors.border,
              ),
              ...prescription.prescriptionItems.map(
                (PrescriptionItem item) {
                  return PrescriptionItemTile(
                    prescriptionItem: item,
                    color: prescription.prescriptionItems.indexOf(item).isEven
                        ? UtanoColors.background
                        : UtanoColors.white,
                    onTap: onSelected,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
