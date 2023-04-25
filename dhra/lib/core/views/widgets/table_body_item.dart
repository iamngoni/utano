//
//  table_body_item
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/configs.dart';
import '../../services/di.dart';
import '../../services/notifications.dart';

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
              horizontal: sx(5),
            ),
            child: MacosTooltip(
              message: text,
              child: GestureDetector(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: text));
                  await di<NotificationsService>().showSuccesssNotification(
                    title: 'Clipboard',
                    message: '🎉 Copied to clipboard',
                  );
                },
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
                    fontSize: sy(9),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
