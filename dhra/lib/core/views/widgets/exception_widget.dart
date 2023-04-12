//
//  exception_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';
import '../../models/data/application_error.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({
    required this.error,
    this.onRetry,
    this.onGoBack,
    super.key,
  });

  final ApplicationError error;
  final VoidCallback? onRetry;
  final VoidCallback? onGoBack;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '📵',
                style: TextStyle(
                  fontSize: sy(40),
                ),
              ),
              Text(
                error.title,
                style: TextStyle(
                  color: UtanoColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: sy(12),
                ),
              ),
              SizedBox(
                height: sy(5),
              ),
              Text(
                error.message,
                style: TextStyle(
                  color: UtanoColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(12),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: sy(15),
              ),
              PushButton(
                buttonSize: ButtonSize.large,
                onPressed: onRetry,
                child: const Text('RETRY'),
              ),
              SizedBox(
                height: sy(5),
              ),
              if (onGoBack != null)
                GestureDetector(
                  onTap: onGoBack,
                  child: Text(
                    'go back',
                    style: TextStyle(
                      color: UtanoColors.active,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(10),
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
