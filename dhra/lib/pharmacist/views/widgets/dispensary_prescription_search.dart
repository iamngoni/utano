//
//  dispensary_prescription_search
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/services/di.dart';
import '../../../core/services/notifications.dart';
import '../../../core/views/widgets/utano_button.dart';
import '../../../core/views/widgets/utano_text_field.dart';
import '../../blocs/dispensary/dispensary_bloc.dart';

class DispensaryPrescriptionSearch extends StatelessWidget {
  DispensaryPrescriptionSearch({
    super.key,
  });

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sx(10),
            vertical: sy(20),
          ),
          decoration: BoxDecoration(
            color: UtanoColors.white,
            border: Border.all(color: UtanoColors.border.withOpacity(0.4)),
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
              Expanded(
                child: UtanoTextField(
                  controller: searchController,
                  label: '',
                  placeholder: 'Prescription Number',
                ),
              ),
              SizedBox(
                width: sx(3),
              ),
              UtanoButton(
                text: ' Get Prescription ',
                onTap: () {
                  if (searchController.text.isNotEmpty) {
                    context
                        .read<DispensaryBloc>()
                        .add(GetPrescription(searchController.text));
                  } else {
                    di<NotificationsService>().showErrorNotification(
                      title: 'Query',
                      message: 'Add prescription number to search',
                    );
                  }
                },
              ),
              SizedBox(
                width: sx(3),
              ),
              const UtanoButton(
                text: ' New Prescription ',
                buttonColor: UtanoColors.green,
              ),
            ],
          ),
        );
      },
    );
  }
}
