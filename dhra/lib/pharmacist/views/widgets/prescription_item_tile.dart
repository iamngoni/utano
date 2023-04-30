//
//  prescription_item_tile
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/prescription_item.dart';

class PrescriptionItemTile extends StatelessWidget {
  const PrescriptionItemTile({
    required this.prescriptionItem,
    required this.color,
    required this.onTap,
    super.key,
  });

  final PrescriptionItem prescriptionItem;
  final Color color;
  final void Function(PrescriptionItem) onTap;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: () {
            onTap(prescriptionItem);
          },
          child: Container(
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(5),
              vertical: sy(10),
            ),
            decoration: BoxDecoration(
              color: color,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '💊'
                        ' ${prescriptionItem.medicine.headingCase}',
                        style: TextStyle(
                          color: UtanoColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(11),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: sx(10),
                    ),
                    Text(
                      'x ${prescriptionItem.quantity}',
                      style: TextStyle(
                        color: UtanoColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: sy(11),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
