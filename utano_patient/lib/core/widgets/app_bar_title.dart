import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          children: [
            Image(
              image: const AssetImage('assets/images/custom-logo-text.png'),
              color: UtanoColors.background,
              height: sy(20),
            ),
            if (title.isNull)
              const SizedBox.shrink()
            else
              Text(
                title!,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(9.5),
                ),
              ),
          ],
        );
      },
    );
  }
}
