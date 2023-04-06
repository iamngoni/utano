//
//  utano_text_field
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class UtanoTextField extends StatelessWidget {
  const UtanoTextField({
    required this.label,
    required this.placeholder,
    this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  final String label;
  final TextEditingController? controller;
  final int maxLines;
  final String placeholder;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: UtanoColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: sy(12),
              ),
            ),
            SizedBox(
              height: sy(3),
            ),
            MacosTextField(
              padding: EdgeInsets.symmetric(
                vertical: sy(10),
                horizontal: sx(7),
              ),
              controller: controller,
              maxLines: maxLines,
              placeholder: placeholder,
              placeholderStyle: TextStyle(
                color: UtanoColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: sy(12),
              ),
              decoration: BoxDecoration(
                color: UtanoColors.white,
                border: Border.all(
                  color: UtanoColors.border.withOpacity(0.5),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              keyboardType: keyboardType,
            ),
          ],
        );
      },
    );
  }
}
