//
//  utano_dropdown_button
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class UtanoDropdownButton<T> extends StatelessWidget {
  const UtanoDropdownButton({
    required this.title,
    required this.items,
    required this.onChanged,
    this.value,
    super.key,
  });

  final String title;
  final List<T> items;
  final T? value;
  final void Function(T? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return MacosPopupButton<T>(
          value: value,
          alignment: Alignment.centerLeft,
          onChanged: onChanged,
          items: items.map<MacosPopupMenuItem<T>>((T value) {
            return MacosPopupMenuItem<T>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          style: TextStyle(
            color: UtanoColors.black,
            fontWeight: FontWeight.w400,
            fontSize: sy(12),
          ),
        );
      },
    );
  }
}
