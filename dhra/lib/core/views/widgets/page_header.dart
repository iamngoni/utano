//
//  page_header
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/configs.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: UtanoColors.black,
                fontWeight: FontWeight.w600,
                fontSize: sy(20),
              ),
            ),
            Image(
              image: const AssetImage('assets/images/logo-red-black.png'),
              height: sy(20),
            ),
          ],
        );
      },
    );
  }
}
