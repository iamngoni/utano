//
//  table_action
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/widgets.dart';

import '../../configs/colors.dart';

class TableAction {
  const TableAction({
    required this.icon,
    required this.tooltipText,
    this.color = UtanoColors.grey,
    this.onTap,
  });

  final String tooltipText;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
}
