//
//  side_bar_tab_item
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class SideBarTabItem extends StatelessWidget {
  const SideBarTabItem({
    required this.title,
    required this.imageIcon,
    this.isActive = false,
    this.onTap,
    super.key,
  });

  final String title;
  final AssetImage imageIcon;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: sx(4),
              vertical: sy(7),
            ),
            margin: EdgeInsets.only(
              bottom: sy(5),
            ),
            decoration: BoxDecoration(
              color: isActive ? UtanoColors.activeTab : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                ImageIcon(
                  imageIcon,
                  color: isActive ? UtanoColors.active : UtanoColors.grey,
                ),
                SizedBox(
                  width: sx(3),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isActive ? UtanoColors.active : UtanoColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(10),
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
