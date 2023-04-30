//
//  dispensary_area
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/prescription.dart';
import '../../../core/models/data/prescription_item.dart';
import '../../../core/services/di.dart';
import '../../../core/services/notifications.dart';
import '../../../core/views/widgets/no_content_widget.dart';
import '../../../core/views/widgets/utano_button.dart';
import '../../blocs/dispensary/dispensary_bloc.dart';
import '../../blocs/drugs/drugs_bloc.dart';
import '../../models/data/dispense_drug.dart';
import '../../models/data/drug.dart';
import 'dispensary_patient_details_section.dart';
import 'dispensed_items_list.dart';
import 'prescription_details_section.dart';

class DispensaryArea extends StatefulWidget {
  const DispensaryArea({required this.prescription, super.key});

  final Prescription prescription;

  @override
  State<DispensaryArea> createState() => _DispensaryAreaState();
}

class _DispensaryAreaState extends State<DispensaryArea> {
  final List<DispenseDrug> dispensedDrugs = [];

  void dispensePrescriptionItem(PrescriptionItem item) {
    final DrugsBloc bloc = context.read<DrugsBloc>();
    if (bloc.state is DrugsLoaded) {
      final List<Drug> drugs = (bloc.state as DrugsLoaded).drugs;
      final Drug? drug = drugs.firstWhereOrNull((d) => d.name == item.medicine);
      if (drug == null) {
        di<NotificationsService>().showErrorNotification(
          title: 'Not Available',
          message: 'Item from prescription is not available or in low supply',
        );
      } else {
        if (!dispensedDrugs.any((d) => d.drug == drug)) {
          if (item.quantity < drug.quantity) {
            dispensedDrugs.add(DispenseDrug(drug, item.quantity));
          } else {
            di<NotificationsService>().showErrorNotification(
              title: 'Low Supply',
              message: 'Item in low supply using available quantity',
            );
            dispensedDrugs.add(DispenseDrug(drug, drug.quantity));
          }

          setState(() {});
        } else {
          di<NotificationsService>().showErrorNotification(
            title: 'Already added',
            message: 'Selected item already exists in list',
          );
        }
      }
    } else {
      di<NotificationsService>().showErrorNotification(
        title: 'Missing drugs',
        message: 'Load drugs first',
      );
    }
  }

  void editDispenseDrugQuantity(DispenseDrug dispenseDrug, int quantity) {
    if (quantity > dispenseDrug.drug.quantity) {
      di<NotificationsService>().showErrorNotification(
        title: 'Quantity Error',
        message: 'Item in low supply',
      );
    } else {
      final DispenseDrug dispenseDrug0 = dispenseDrug.copyWith(quantity);
      dispensedDrugs[dispensedDrugs.indexOf(dispenseDrug)] = dispenseDrug0;
      setState(() {});
    }
  }

  void removeDispenseDrug(DispenseDrug dispenseDrug) {
    dispensedDrugs.remove(dispenseDrug);
    setState(() {});
  }

  double get totalCost {
    double cost = 0;
    for (final d in dispensedDrugs) {
      cost += d.quantity * d.drug.price;
    }

    return cost;
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Row(
          children: [
            PrescriptionDetailsSection(
              prescription: widget.prescription,
              onSelected: dispensePrescriptionItem,
            ),
            Container(
              height: context.height,
              width: sx(0.5),
              color: UtanoColors.border,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DispensaryPatientDetailsSection(
                    prescription: widget.prescription,
                  ),
                  Expanded(
                    child: dispensedDrugs.isNotEmpty
                        ? DispensedItemsList(
                            dispensedDrugs: dispensedDrugs,
                            onRemove: removeDispenseDrug,
                            onEdit: editDispenseDrugQuantity,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: NoContentWidget(
                                  size: 100,
                                ),
                              ),
                              Text('No items has been selected yet'),
                            ],
                          ),
                  ),
                  if (dispensedDrugs.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: sx(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Cost',
                                style: TextStyle(
                                  color: UtanoColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: sy(12),
                                ),
                              ),
                              SizedBox(
                                width: sx(5),
                              ),
                              Text(
                                '\$${totalCost.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: UtanoColors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: sy(15),
                                ),
                              ),
                            ],
                          ),
                          UtanoButton(
                            text: ' CONTINUE ',
                            onTap: () {
                              context.read<DispensaryBloc>().add(
                                    ProcessPrescription(
                                      widget.prescription,
                                      dispensedDrugs,
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
