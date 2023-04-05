//
//  loader_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    this.radius = 15,
    this.color = UtanoColors.white,
    super.key,
  });

  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Center(
          child: CupertinoActivityIndicator(
            radius: sy(radius),
            color: color,
          ),
        );
      },
    );
  }
}
