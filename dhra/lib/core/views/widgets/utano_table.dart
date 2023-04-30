//
//  utano_table
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:handy_extensions/handy_extensions.dart';

import '../../models/data/model.dart';
import '../../models/utils/table_action.dart';
import '../../utils/constants.dart';
import 'table_actions_row.dart';
import 'table_body_item.dart';
import 'table_header_title.dart';

class UtanoTable extends StatelessWidget {
  UtanoTable({
    required this.titles,
    required this.modelFields,
    required this.items,
    this.actions = const [],
    super.key,
  })  : assert(
          titles.length == modelFields.length,
          'Titles and fields should be equal',
        ),
        assert(
          actions.isNotEmpty,
          'Provide actions for the table',
        );

  final List<String> titles;
  final List<String> modelFields;
  final List<Model> items;
  final List<TableAction> actions;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: tableBorder,
      children: [
        TableRow(
          children: [
            ...titles.map(
              (t) => TableHeaderTitle(
                title: t.titleCase,
              ),
            ),
            const TableHeaderTitle(
              title: 'Actions',
            )
          ],
        ),
        ...items.map(
          (Model m) {
            final Map<String, dynamic> data = m.toJson();
            return TableRow(
              children: [
                ...modelFields.map((f) {
                  return TableBodyItem('${data[f]}');
                }),
                TableActionsRow(
                  actions: actions.map((e) => e).toList(),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
