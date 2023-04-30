//
//  no_content_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:relative_scale/relative_scale.dart';

class NoContentWidget extends StatelessWidget {
  const NoContentWidget({this.size = 200, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Lottie.asset(
          'assets/lottie/nothing.json',
          height: sy(size),
          width: sy(size),
          fit: BoxFit.fill,
        );
      },
    );
  }
}
