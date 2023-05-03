import 'package:flutter/material.dart';

import '../configs/colors.dart';
import 'app_bar_title.dart';

AppBar buildAppBar(
  BuildContext context, {
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Theme.of(context)
        .copyWith(scaffoldBackgroundColor: const Color(0xFFF4F4F4))
        .scaffoldBackgroundColor,
    title: AppBarTitle(
      title: title,
    ),
    centerTitle: true,
    // ignore: use_decorated_box
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.background,
          ),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.background,
    ),
    actions: actions,
  );
}
