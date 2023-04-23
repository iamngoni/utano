//
//  no_items_prescribed_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 23/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:relative_scale/relative_scale.dart';

class NoItemsPrescribedWidget extends StatelessWidget {
  const NoItemsPrescribedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/lottie/nothing.json',
                height: sy(150),
              ),
            ),
            const Text(
              'No items have been prescribed yet',
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
