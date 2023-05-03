import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    super.key,
    required this.value,
    this.onTap,
  });

  final bool value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: sy(22),
            width: sx(90),
            child: Stack(
              children: [
                Container(
                  height: sy(22),
                  width: sx(90),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: value ? 0 : sx(41),
                  child: Container(
                    height: sy(18),
                    width: sy(18),
                    margin: EdgeInsets.symmetric(
                      horizontal: sx(5),
                    ),
                    decoration: BoxDecoration(
                      color:
                          value ? Colors.white : Colors.white.withOpacity(0.85),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
