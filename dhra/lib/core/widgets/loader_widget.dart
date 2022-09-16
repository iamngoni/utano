import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key, this.color = Colors.white});

  final Color color;

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
        return SizedBox(
          height: sy(25),
          width: sy(25),
          child: CupertinoActivityIndicator(
            color: color,
          ),
        );
      },
    );
  }
}
