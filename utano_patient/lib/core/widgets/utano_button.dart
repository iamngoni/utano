//
//  utano_button
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 3/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class UtanoButton extends StatelessWidget {
  const UtanoButton({
    required this.text,
    this.onTap,
    super.key,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(12),
          ),
          decoration: BoxDecoration(
            color: UtanoColors.light,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: UtanoColors.dark,
              fontWeight: FontWeight.w500,
              fontSize: sy(9),
            ),
          ),
        ),
      );
    });
  }
}
