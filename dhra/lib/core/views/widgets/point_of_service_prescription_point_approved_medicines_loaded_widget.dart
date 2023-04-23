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
import 'package:lottie/lottie.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/approved_medicine/approved_medicines_bloc.dart';
import '../../configs/colors.dart';
import '../../models/data/approved_medicine.dart';
import '../../models/data/pos_prescription_item.dart';
import 'utano_button.dart';
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
    // TODO(iamngoni): handle this man
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
                      children: widget.medicines
                          .where(_filter)
                          .map(
                            (e) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: sx(5),
                                vertical: sy(5),
                              ),
                              decoration: BoxDecoration(
                                color: widget.medicines
                                        .where(_filter)
                                        .toList()
                                        .indexOf(e)
                                        .isEven
                                    ? UtanoColors.background
                                    : UtanoColors.white,
                              ),
                              child: MacosListTile(
                                onClick: () => _prescribeMedication(e),
                                leading: const Text('💊'),
                                title: Text(
                                  e.name.headingCase,
                                  style: TextStyle(
                                    color: UtanoColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: sy(12),
                                  ),
                                ),
                                subtitle: Text(
                                  e.description,
                                  style: TextStyle(
                                    color: UtanoColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: sy(10),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
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
                      child: _prescribedDrugs.isNotEmpty
                          ? ListView(
                              children: _prescribedDrugs.map((e) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: sx(10),
                                    vertical: sy(10),
                                  ),
                                  decoration: BoxDecoration(
                                    color: _prescribedDrugs.indexOf(e).isEven
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
                                                _manuallyEditMedicationCount(
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
                                            onTap: () =>
                                                _decrementMedicationCount(
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
                                            onTap: () =>
                                                _incrementMedicationCount(
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
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Lottie.asset(
                                    'assets/lottie/nothing.json',
                                    height: sy(150),
                                  ),
                                ),
                                const Text(
                                  'No items have been prescribed yet',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        UtanoButton(
                          text: 'CONTINUE',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
