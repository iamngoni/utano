//
//  table_actions_row
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../models/utils/table_action.dart';

class TableActionsRow extends StatelessWidget {
  TableActionsRow({
    required this.actions,
    super.key,
  }) : assert(
          actions.isNotEmpty && actions.length < 4,
          'TableActionsRow can only have 1, 2 or 3 actions',
        );

  final List<TableAction> actions;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return TableCell(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sx(5),
            ),
            child: Wrap(
              children: actions
                  .map(
                    (e) => GestureDetector(
                      onTap: e.onTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: sy(8.5),
                        ),
                        margin: EdgeInsets.only(
                          right: sx(5),
                        ),
                        child: MacosTooltip(
                          message: e.tooltipText,
                          child: Icon(
                            e.icon,
                            color: e.color,
                            size: sy(13),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
