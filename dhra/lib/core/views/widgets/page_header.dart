//
//  page_header
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/configs.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    required this.title,
    this.canGoBack = false,
    this.onGoBack,
    super.key,
  }) : assert(
          canGoBack == true ? onGoBack != null : true,
          'onGoBack action is required!',
        );

  final String title;
  final bool canGoBack;
  final VoidCallback? onGoBack;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (canGoBack)
                  Padding(
                    padding: EdgeInsets.only(
                      right: sx(7),
                    ),
                    child: GestureDetector(
                      onTap: onGoBack,
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        color: UtanoColors.black,
                        size: sy(20),
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                Text(
                  title,
                  style: TextStyle(
                    color: UtanoColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: sy(20),
                  ),
                ),
              ],
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
