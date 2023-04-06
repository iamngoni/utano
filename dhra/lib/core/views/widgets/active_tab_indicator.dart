//
//  active_tab_indicator
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class ActiveTabIndicator extends StatelessWidget {
  const ActiveTabIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: sx(30),
          height: sy(5),
          margin: EdgeInsets.only(
            top: sy(7),
          ),
          decoration: BoxDecoration(
            color: UtanoColors.active,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}
