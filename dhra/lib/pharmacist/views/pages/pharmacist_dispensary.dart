//
//  pharmacist_dispensary
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/views/widgets/page_header.dart';
import '../../../core/views/widgets/utano_button.dart';
import '../../../core/views/widgets/utano_text_field.dart';

class PharmacistDispensaryPage extends StatelessWidget {
  const PharmacistDispensaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: 'Dispensary',
              ),
              SizedBox(
                height: sy(20),
              ),
              SizedBox(
                height: sy(10),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sx(10),
                  vertical: sy(20),
                ),
                decoration: BoxDecoration(
                  color: UtanoColors.white,
                  border:
                      Border.all(color: UtanoColors.border.withOpacity(0.4)),
                  boxShadow: [
                    BoxShadow(
                      color: UtanoColors.grey.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0.5, 0.5),
                    ),
                    BoxShadow(
                      color: UtanoColors.grey.withOpacity(0.07),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(-0.5, -0.5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: UtanoTextField(
                        label: '',
                        placeholder: 'Prescription Number',
                      ),
                    ),
                    SizedBox(
                      width: sx(3),
                    ),
                    UtanoButton(
                      text: ' Get Prescription ',
                    ),
                    SizedBox(
                      width: sx(3),
                    ),
                    UtanoButton(
                      text: ' New Prescription ',
                      buttonColor: UtanoColors.green,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Expanded(
                child: Container(
                  height: context.height,
                  width: context.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: sx(10),
                    vertical: sy(20),
                  ),
                  decoration: BoxDecoration(
                    color: UtanoColors.white,
                    border:
                        Border.all(color: UtanoColors.border.withOpacity(0.4)),
                    boxShadow: [
                      BoxShadow(
                        color: UtanoColors.grey.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0.5, 0.5),
                      ),
                      BoxShadow(
                        color: UtanoColors.grey.withOpacity(0.07),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(-0.5, -0.5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
