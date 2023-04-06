//
//  table_header_title
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class TableHeaderTitle extends StatelessWidget {
  const TableHeaderTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return TableCell(
          child: Container(
            // margin: EdgeInsets.only(
            //   bottom: sy(5),
            // ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: UtanoColors.border,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: sy(10),
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: UtanoColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(10),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
