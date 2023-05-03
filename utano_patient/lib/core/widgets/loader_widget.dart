import 'package:flutter/cupertino.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
    this.color = AppColors.light,
    this.radius = 11,
  });

  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (
        context,
        height,
        width,
        sy,
        sx,
      ) {
        return CupertinoActivityIndicator(
          color: color,
          radius: sy(radius),
        );
      },
    );
  }
}
