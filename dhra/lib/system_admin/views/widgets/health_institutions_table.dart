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
import '../../../core/models/utils/table_action.dart';
import '../../../core/views/widgets/exception_widget.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/table_actions_row.dart';
import '../../../core/views/widgets/table_body_item.dart';
import '../../../core/views/widgets/table_header_title.dart';
import '../../../general/blocs/navigation/navigation_bloc.dart';
import '../../blocs/health_institution_employees/health_institution_employees_bloc.dart';
import '../../blocs/health_institutions/health_institutions_bloc.dart';

class HealthInstitutionsTable extends StatelessWidget {
  const HealthInstitutionsTable({super.key});

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
                child: BlocBuilder<HealthInstitutionsBloc,
                    HealthInstitutionsState>(
                  builder: (context, state) {
                    late Widget healthInstitutionsTableWidget;

                    if (state is HealthInstitutionsError) {
                      healthInstitutionsTableWidget = ExceptionWidget(
                        error: state.error,
                        onRetry: () => context
                            .read<HealthInstitutionsBloc>()
                            .add(ListHealthInstitutions()),
                      );
                    } else if (state is HealthInstitutionsLoading) {
                      healthInstitutionsTableWidget = const Center(
                        child: LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      );
                    } else if (state is HealthInstitutionsLoaded) {
                      healthInstitutionsTableWidget = SizedBox(
                        height: context.height,
                        width: context.width,
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
                            ...state.healthInstitutions.map(
                              (e) => TableRow(
                                // decoration: BoxDecoration(),
                                children: [
                                  TableBodyItem(e.name),
                                  TableBodyItem(e.email),
                                  TableBodyItem(e.phoneNumber),
                                  TableBodyItem(e.address),
                                  TableActionsRow(
                                    actions: [
                                      TableAction(
                                        icon: CupertinoIcons.eye,
                                        tooltipText: 'View Employees',
                                        color: UtanoColors.active,
                                        onTap: () {
                                          context
                                              .read<
                                                  HealthInstitutionEmployeesBloc>()
                                              .add(
                                                ListHealthInstitutionEmployees(
                                                  e,
                                                ),
                                              );
                                          context
                                              .read<NavigationBloc>()
                                              .add(const Navigate(4));
                                        },
                                      ),
                                      const TableAction(
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
                      );
                    } else {
                      healthInstitutionsTableWidget = const Center(
                        child: LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      );
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: healthInstitutionsTableWidget,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
