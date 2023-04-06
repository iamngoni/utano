//
//  utano_button
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class UtanoButton extends StatelessWidget {
  const UtanoButton({
    this.text = 'SUBMIT',
    this.onTap,
    super.key,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: sy(10),
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: UtanoColors.active,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: UtanoColors.white,
                fontWeight: FontWeight.w500,
                fontSize: sy(12),
              ),
            ),
          ),
        );
      },
    );
  }
}
