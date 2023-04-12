//
//  health_institution_employees_table
//  dhra
//
//  Created by Ngonidzashe Mangudya on 9/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/employee.dart';
import '../../../core/models/data/health_institution.dart';
import '../../../core/models/utils/table_action.dart';
import '../../../core/views/widgets/table_actions_row.dart';
import '../../../core/views/widgets/table_body_item.dart';
import '../../../core/views/widgets/table_header_title.dart';
import '../../blocs/health_institution_employees/health_institution_employees_bloc.dart';

class HealthInstitutionEmployeesTable extends StatelessWidget {
  const HealthInstitutionEmployeesTable({
    required this.healthInstitution,
    required this.employees,
    super.key,
  });

  final HealthInstitution healthInstitution;
  final List<Employee> employees;

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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    healthInstitution.name,
                    style: TextStyle(
                      color: UtanoColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(12),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context
                        .read<HealthInstitutionEmployeesBloc>()
                        .add(ListHealthInstitutionEmployees(healthInstitution)),
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
                child: employees.isNotEmpty
                    ? Table(
                        children: [
                          const TableRow(
                            children: [
                              TableHeaderTitle(
                                title: 'Full Name',
                              ),
                              TableHeaderTitle(
                                title: 'Professional Title',
                              ),
                              TableHeaderTitle(
                                title: 'Role',
                              ),
                              TableHeaderTitle(
                                title: 'Institution',
                              ),
                              TableHeaderTitle(
                                title: 'Province',
                              ),
                              TableHeaderTitle(
                                title: 'District',
                              ),
                              TableHeaderTitle(
                                title: 'Actions',
                              ),
                            ],
                          ),
                          ...employees.map(
                            (e) => TableRow(
                              children: [
                                TableBodyItem(
                                  '${e.user.firstName} ${e.user.lastName}',
                                ),
                                TableBodyItem(
                                  e.professionalTitle ?? 'n/a',
                                ),
                                TableBodyItem(
                                  e.user.role.name.titleCase,
                                ),
                                TableBodyItem(e.registeredAt.name),
                                TableBodyItem(
                                  '${e.registeredAt.district.province?.name}',
                                ),
                                TableBodyItem(
                                  e.registeredAt.district.name,
                                ),
                                TableActionsRow(
                                  actions: const [
                                    TableAction(
                                      icon: CupertinoIcons.pen,
                                      tooltipText: 'Edit Information',
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
                      )
                    : Center(
                        child: Text(
                          'Unfortunately ${healthInstitution.name} has no employees',
                          style: TextStyle(
                            color: UtanoColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: sy(12),
                          ),
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
