//
//  pos_prescribed_items_area
//  dhra
//
//  Created by Ngonidzashe Mangudya on 23/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/point_of_service/point_of_service_bloc.dart';
import '../../configs/colors.dart';
import '../../models/data/approved_medicine.dart';
import '../../models/data/pos_prescription_item.dart';
import '../../services/di.dart';
import '../../services/notifications.dart';
import 'no_items_prescribed_widget.dart';
import 'utano_button.dart';

class PosPrescribedItemsArea extends StatelessWidget {
  const PosPrescribedItemsArea({
    required this.prescribedItems,
    required this.incrementMedicationQuantity,
    required this.decrementMedicationQuantity,
    required this.onManuallyEditMedicationCount,
    super.key,
  });

  final List<PosPrescriptionItem> prescribedItems;
  final void Function(ApprovedMedicine medicine) incrementMedicationQuantity;
  final void Function(ApprovedMedicine medicine) decrementMedicationQuantity;
  final void Function(int count, ApprovedMedicine medicine)
      onManuallyEditMedicationCount;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(10),
            vertical: sy(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prescribed Items',
                style: TextStyle(
                  color: UtanoColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: sy(12),
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Expanded(
                child: prescribedItems.isNotEmpty
                    ? ListView(
                        children: prescribedItems.map((e) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: sx(10),
                              vertical: sy(10),
                            ),
                            decoration: BoxDecoration(
                              color: prescribedItems.indexOf(e).isEven
                                  ? UtanoColors.background
                                  : UtanoColors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.medicine.name,
                                  ),
                                ),
                                SizedBox(
                                  width: sx(10),
                                ),
                                Container(
                                  width: sx(20),
                                  height: sy(30),
                                  alignment: Alignment.center,
                                  child: MacosTextField(
                                    controller: TextEditingController(
                                      text: e.count.toString(),
                                    ),
                                    onChanged: (String? value) {
                                      if (value!.isNotEmpty) {
                                        if (value.isNumeric) {
                                          onManuallyEditMedicationCount(
                                            int.parse(value),
                                            e.medicine,
                                          );
                                        }
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(
                                  width: sx(10),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => decrementMedicationQuantity(
                                        e.medicine,
                                      ),
                                      child: Container(
                                        height: sy(20),
                                        width: sy(20),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: UtanoColors.red,
                                        ),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: UtanoColors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: sy(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => incrementMedicationQuantity(
                                        e.medicine,
                                      ),
                                      child: Container(
                                        height: sy(20),
                                        width: sy(20),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: UtanoColors.active,
                                        ),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            color: UtanoColors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: sy(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    : const NoItemsPrescribedWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UtanoButton(
                    text: 'CONTINUE',
                    onTap: () {
                      if (prescribedItems.isNotEmpty) {
                        context.read<PointOfServiceBloc>().add(
                              PrescribeMedication(
                                prescriptionItems: prescribedItems,
                                checkIn: (context
                                        .read<PointOfServiceBloc>()
                                        .state as PointOfServiceIdle)
                                    .checkIn!,
                              ),
                            );
                      } else {
                        di<NotificationsService>().showErrorNotification(
                          title: 'Missing items',
                          message: 'Missing prescription items',
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
