/*
    @Project: hekima_patient
    @Date: 14, September, 2022
    @Author: Ngonidzashe Mangudya
 
    Copyright (c) 2022 ModestNerd
*/
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/configs.dart';
import '../models/app_exception.dart';

class BlocExceptionWidget extends StatelessWidget {
  const BlocExceptionWidget({
    super.key,
    required this.exception,
    this.retryAction,
  });

  final VoidCallback? retryAction;
  final AppException exception;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "🧘",
              style: TextStyle(
                fontSize: sy(50),
              ),
            ),
            SizedBox(
              height: sy(10),
            ),
            Text(
              exception.title,
              style: TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.bold,
                fontSize: sy(11),
              ),
            ),
            SizedBox(
              height: sy(3),
            ),
            Text(
              exception.message,
              style: TextStyle(
                color: AppColors.light,
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
              ),
              maxLines: 4,
            ),
            SizedBox(
              height: sy(25),
            ),
            InkWell(
              onTap: retryAction,
              child: Text(
                "Retry",
                style: TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(9),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
