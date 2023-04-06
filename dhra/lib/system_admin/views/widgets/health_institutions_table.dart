//
//  health_institutions_table
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/health_institution.dart';
import '../../../core/models/utils/table_action.dart';
import '../../../core/views/widgets/table_actions_row.dart';
import '../../../core/views/widgets/table_body_item.dart';
import '../../../core/views/widgets/table_header_title.dart';
import '../../blocs/health_institutions/health_institutions_bloc.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Health Institutions',
                    style: TextStyle(
                      color: UtanoColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(12),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context
                        .read<HealthInstitutionsBloc>()
                        .add(ListHealthInstitutions()),
                    child: Icon(
                      CupertinoIcons.refresh_thick,
                      color: UtanoColors.grey,
                      size: sy(15),
                    ),
                  ),
                ],
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
                    ...healthInstitutions.map(
                      (e) => TableRow(
                        // decoration: BoxDecoration(),
                        children: [
                          TableBodyItem(e.name),
                          TableBodyItem(e.email),
                          TableBodyItem(e.phoneNumber),
                          TableBodyItem(e.address),
                          TableActionsRow(
                            actions: const [
                              TableAction(
                                icon: CupertinoIcons.eye,
                                tooltipText: 'View',
                                color: UtanoColors.active,
                              ),
                              TableAction(
                                icon: CupertinoIcons
                                    .person_crop_circle_badge_plus,
                                tooltipText: 'Add Administrators',
                                color: UtanoColors.green,
                              ),
                              TableAction(
                                icon: CupertinoIcons.delete,
                                tooltipText: 'Delete From System',
                                color: UtanoColors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}