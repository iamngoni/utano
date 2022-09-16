/*
    @Project: hekima_patient
    @Date: 10, September, 2022
    @Author: Ngonidzashe Mangudya

    Copyright (c) 2022 ModestNerd
*/

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

class ErrorDialogWidget extends StatelessWidget {
  const ErrorDialogWidget({
    Key? key,
    required this.title,
    required this.message,
    this.buttonText = "Okay",
    this.onButtonClick,
    this.isLogout = false,
  });

  final String title;
  final String message;
  final String? buttonText;
  final Function? onButtonClick;
  final bool? isLogout;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        width: context.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
              vertical: sy(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: sy(13),
                  ),
                ),
                SizedBox(
                  height: sy(15),
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: sy(10),
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: sy(15),
                ),
                GestureDetector(
                  onTap: () {
                    if (onButtonClick != null) {
                      onButtonClick!();
                      context.goBack();
                    } else {
                      context.goBack();
                    }
                  },
                  child: Container(
                    width: context.width,
                    padding: EdgeInsets.symmetric(
                      vertical: sy(10),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // TODO: fix colors here
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(3, 1.5),
                        ),
                      ],
                    ),
                    child: Text(
                      buttonText ?? "Okay",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sy(11),
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
