import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.color = Colors.white,
    this.textColor = AppColors.background,
    this.onTap,
    this.verticalPadding = 13,
    required this.text,
  });

  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback? onTap;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: context.width,
            padding: EdgeInsets.symmetric(
              vertical: sy(verticalPadding),
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: sy(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
