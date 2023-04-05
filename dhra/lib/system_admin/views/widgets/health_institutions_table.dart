//
//  health_institutions_table
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/health_institution.dart';
import '../../../core/views/widgets/table_body_item.dart';
import '../../../core/views/widgets/table_header_title.dart';

class HealthInstitutionsTable extends StatelessWidget {
  const HealthInstitutionsTable({required this.healthInstitutions, super.key});

  final List<HealthInstitution<String>> healthInstitutions;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: context.height,
          width: context.width,
          decoration: BoxDecoration(
            color: UtanoColors.white,
            border: Border.all(color: UtanoColors.border.withOpacity(0.4)),
            boxShadow: [
              BoxShadow(
                color: UtanoColors.grey.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(1, 1),
              ),
              BoxShadow(
                color: UtanoColors.grey.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(-1, -1),
              ),
            ],
            borderRadius: BorderRadius.circular(11),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: sx(10),
              vertical: sy(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Health Institutions',
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
                  child: Table(
                    children: [
                      const TableRow(
                        children: [
                          TableHeaderTitle(
                            title: 'Name',
                          ),
                          TableHeaderTitle(
                            title: 'Email',
                          ),
                          TableHeaderTitle(
                            title: 'Phone',
                          ),
                          TableHeaderTitle(
                            title: 'Address',
                          ),
                          TableHeaderTitle(
                            title: 'Actions',
                          ),
                        ],
                      ),
                      ...healthInstitutions
                          .map(
                            (e) => TableRow(
                              decoration: BoxDecoration(
                                color: healthInstitutions.indexOf(e).isEven
                                    ? UtanoColors.blueGrey
                                    : UtanoColors.activeGrey,
                              ),
                              children: [
                                TableBodyItem(e.name),
                                TableBodyItem(e.phoneNumber),
                                TableBodyItem(e.name),
                                TableBodyItem(e.address),
                                TableBodyItem(e.name),
                              ],
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
