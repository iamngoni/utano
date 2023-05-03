import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/configs.dart';
import '../models/data/app_exception.dart';
import 'button_widget.dart';

class ExceptionWidget extends StatefulWidget {
  const ExceptionWidget({
    super.key,
    required this.exception,
    this.onRetry,
    this.titleColor = AppColors.light,
    this.buttonTextColor = AppColors.background,
    this.buttonColor = AppColors.light,
  });

  final VoidCallback? onRetry;
  final AppException exception;
  final Color titleColor;
  final Color buttonTextColor;
  final Color buttonColor;

  @override
  State<ExceptionWidget> createState() => _ExceptionWidgetState();
}

class _ExceptionWidgetState extends State<ExceptionWidget> {
  void doTheThing() {
    if (widget.exception.message.contains('Session expired')) {
      context.notify(
        message: 'Session expired. Please login again',
        isError: true,
      );
    } else {
      if (widget.onRetry != null) {
        widget.onRetry!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🙁',
              style: TextStyle(
                fontSize: sy(50),
                color: widget.titleColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: sy(7),
            ),
            Text(
              widget.exception.title,
              style: TextStyle(
                color: widget.titleColor,
                fontWeight: FontWeight.bold,
                fontSize: sy(11),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: sy(3),
            ),
            Text(
              widget.exception.message,
              style: TextStyle(
                color: widget.titleColor,
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
              ),
              maxLines: 4,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: sy(25),
            ),
            ButtonWidget(
              text: 'Try Again',
              textColor: widget.buttonTextColor,
              color: widget.buttonColor,
              onTap: doTheThing,
            ),
          ],
        );
      },
    );
  }
}
