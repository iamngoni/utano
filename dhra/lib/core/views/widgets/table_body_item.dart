//
//  table_body_item
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/configs.dart';

class TableBodyItem extends StatelessWidget {
  const TableBodyItem(
    this.text, {
    this.bold = false,
    this.textColor = UtanoColors.black,
    super.key,
  });

  final String text;
  final Color textColor;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: sy(10),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
                fontSize: sy(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
