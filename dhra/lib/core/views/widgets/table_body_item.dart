//
//  table_body_item
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
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
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: UtanoColors.border.withOpacity(0.3),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: sy(10),
              ),
              child: MacosTooltip(
                message: text,
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
                    fontSize: sy(10),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
