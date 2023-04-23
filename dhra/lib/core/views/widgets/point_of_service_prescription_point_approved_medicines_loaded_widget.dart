//
//  point_of_service_prescription_point_approved_medicines_loaded_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 23/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/approved_medicine/approved_medicines_bloc.dart';
import '../../configs/colors.dart';
import '../../models/data/approved_medicine.dart';
import '../../models/data/pos_prescription_item.dart';
import 'approved_medicine_tile.dart';
import 'pos_prescribed_items_area.dart';
import 'utano_text_field.dart';

class PointOfServicePrescriptionPointApprovedMedicinesLoadedWidget
    extends StatefulWidget {
  const PointOfServicePrescriptionPointApprovedMedicinesLoadedWidget({
    required this.medicines,
    super.key,
  });

  final List<ApprovedMedicine> medicines;

  @override
  State<PointOfServicePrescriptionPointApprovedMedicinesLoadedWidget>
      createState() =>
          _PointOfServicePrescriptionPointApprovedMedicinesLoadedWidgetState();
}

class _PointOfServicePrescriptionPointApprovedMedicinesLoadedWidgetState
    extends State<
        PointOfServicePrescriptionPointApprovedMedicinesLoadedWidget> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final List<PosPrescriptionItem> _prescribedDrugs = [];

  bool _filter(ApprovedMedicine medicine) {
    final String query = _searchController.text.toLowerCase();
    final bool queryMatchesCorrectly = query.isNotEmpty
        ? medicine.name.toLowerCase().contains(query) ||
            medicine.description.toLowerCase().contains(query)
        : true;
    final bool hasDrugBeenPrescribedAlready =
        _prescribedDrugs.any((d) => d.medicine == medicine);

    return hasDrugBeenPrescribedAlready ? false : queryMatchesCorrectly;
  }

  void _prescribeMedication(ApprovedMedicine medicine) {
    setState(() {
      _prescribedDrugs.insert(
        0,
        PosPrescriptionItem(medicine: medicine, count: 1),
      );
    });
  }

  void _removePrescribedMedication(ApprovedMedicine medicine) {
    setState(() {
      _prescribedDrugs.removeWhere((e) => e.medicine == medicine);
    });
  }

  void _incrementMedicationCount(ApprovedMedicine medicine) {
    final PosPrescriptionItem? posPrescriptionItem =
        _prescribedDrugs.firstWhereOrNull((d) => d.medicine == medicine);
    if (posPrescriptionItem != null) {
      final PosPrescriptionItem posPrescriptionItem0 =
          posPrescriptionItem.copyWith(count: posPrescriptionItem.count + 1);
      setState(() {
        _prescribedDrugs[_prescribedDrugs.indexOf(posPrescriptionItem)] =
            posPrescriptionItem0;
      });
    }
  }

  void _decrementMedicationCount(ApprovedMedicine medicine) {
    final PosPrescriptionItem? posPrescriptionItem =
        _prescribedDrugs.firstWhereOrNull((d) => d.medicine == medicine);
    if (posPrescriptionItem != null) {
      if (posPrescriptionItem.count == 1) {
        _removePrescribedMedication(medicine);
      } else {
        final PosPrescriptionItem posPrescriptionItem0 =
            posPrescriptionItem.copyWith(count: posPrescriptionItem.count - 1);
        setState(() {
          _prescribedDrugs[_prescribedDrugs.indexOf(posPrescriptionItem)] =
              posPrescriptionItem0;
        });
      }
    }
  }

  void _manuallyEditMedicationCount(int count, ApprovedMedicine medicine) {
    final PosPrescriptionItem? posPrescriptionItem =
        _prescribedDrugs.firstWhereOrNull((d) => d.medicine == medicine);
    if (posPrescriptionItem != null) {
      if (count == 0) {
        _removePrescribedMedication(medicine);
      } else {
        final PosPrescriptionItem posPrescriptionItem0 =
            posPrescriptionItem.copyWith(count: count);
        setState(() {
          _prescribedDrugs[_prescribedDrugs.indexOf(posPrescriptionItem)] =
              posPrescriptionItem0;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Row(
          children: [
            Container(
              height: context.height,
              width: sx(150),
              padding: EdgeInsets.symmetric(
                horizontal: sx(10),
                vertical: sy(10),
              ),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: UtanoColors.background,
                    width: sx(1.5),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Approved Medicines & Items',
                          style: TextStyle(
                            color: UtanoColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: sy(12),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context
                            .read<ApprovedMedicinesBloc>()
                            .add(ListApprovedMedicines()),
                        child: Icon(
                          CupertinoIcons.refresh_thick,
                          color: UtanoColors.grey,
                          size: sy(15),
                        ),
                      ),
                    ],
                  ),
                  UtanoTextField(
                    controller: _searchController,
                    label: '',
                    placeholder: 'Search 💉💊',
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Expanded(
                    child: ListView(
                      controller: _scrollController,
                      children:
                          widget.medicines.where(_filter).map<Widget>((e) {
                        return ApprovedMedicineTile(
                          medicine: e,
                          color: widget.medicines
                                  .where(_filter)
                                  .toList()
                                  .indexOf(e)
                                  .isEven
                              ? UtanoColors.background
                              : UtanoColors.white,
                          prescribeMedication: _prescribeMedication,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PosPrescribedItemsArea(
                prescribedItems: _prescribedDrugs,
                incrementMedicationQuantity: _incrementMedicationCount,
                decrementMedicationQuantity: _decrementMedicationCount,
                onManuallyEditMedicationCount: _manuallyEditMedicationCount,
              ),
            ),
          ],
        );
      },
    );
  }
}
