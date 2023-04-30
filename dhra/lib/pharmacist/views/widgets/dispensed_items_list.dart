//
//  dispensed_items_list
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../models/data/dispense_drug.dart';

class DispensedItemsList extends StatelessWidget {
  const DispensedItemsList({
    required this.dispensedDrugs,
    required this.onRemove,
    required this.onEdit,
    super.key,
  });

  final List<DispenseDrug> dispensedDrugs;
  final void Function(DispenseDrug) onRemove;
  final void Function(DispenseDrug, int) onEdit;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return ListView(
          children: dispensedDrugs.map((d) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: sx(5),
                vertical: sy(10),
              ),
              decoration: BoxDecoration(
                color: dispensedDrugs.indexOf(d).isEven
                    ? UtanoColors.background
                    : UtanoColors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${d.drug.name} @ \$${d.drug.price}',
                    ),
                  ),
                  SizedBox(
                    width: sx(5),
                  ),
                  Container(
                    width: sx(20),
                    height: sy(30),
                    alignment: Alignment.center,
                    child: MacosTextField(
                      controller: TextEditingController(
                        text: d.quantity.toString(),
                      ),
                      onChanged: (String? value) {
                        if (value!.isNotEmpty) {
                          if (value.isNumeric) {
                            onEdit(d, double.parse(value).toInt());
                          }
                        }
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: sx(5),
                  ),
                  GestureDetector(
                    onTap: () {
                      onRemove(d);
                    },
                    child: Icon(
                      CupertinoIcons.trash,
                      color: UtanoColors.red,
                      size: sy(15),
                    ),
                  ),
                  SizedBox(
                    width: sx(5),
                  ),
                  Text('\$${(d.quantity * d.drug.price).toStringAsFixed(2)}'),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
