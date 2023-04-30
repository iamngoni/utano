//
//  employees_table
//  dhra
//
//  Created by Ngonidzashe Mangudya on 8/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/employee.dart';
import '../../../core/models/data/user_role.dart';
import '../../../core/models/utils/table_action.dart';
import '../../../core/utils/constants.dart';
import '../../../core/views/widgets/exception_widget.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/table_actions_row.dart';
import '../../../core/views/widgets/table_body_item.dart';
import '../../../core/views/widgets/table_header_title.dart';
import '../../../core/views/widgets/utano_text_field.dart';
import '../../blocs/employees/employees_bloc.dart';

class EmployeesTable extends StatefulWidget {
  const EmployeesTable({this.role, super.key});

  final UserRole? role;

  @override
  State<EmployeesTable> createState() => _EmployeesTableState();
}

class _EmployeesTableState extends State<EmployeesTable> {
  final TextEditingController searchController = TextEditingController();
  bool passesRole(Employee employee) {
    if (widget.role != null) {
      return employee.user.role == widget.role &&
          '${employee.user.firstName} ${employee.user.lastName}'
              .toLowerCase()
              .contains(searchController.text.toLowerCase());
    } else {
      return '${employee.user.firstName} ${employee.user.lastName}'
          .toLowerCase()
          .contains(searchController.text.toLowerCase());
    }
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.role != null ? widget.role!.name.titleCase : 'All',
                    style: TextStyle(
                      color: UtanoColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(12),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.read<EmployeesBloc>().add(ListEmployees()),
                    child: Icon(
                      CupertinoIcons.refresh_thick,
                      color: UtanoColors.grey,
                      size: sy(15),
                    ),
                  ),
                ],
              ),
              UtanoTextField(
                label: '',
                placeholder: 'Search',
                controller: searchController,
              ),
              SizedBox(
                height: sy(10),
              ),
              Expanded(
                child: BlocBuilder<EmployeesBloc, EmployeesState>(
                  builder: (context, state) {
                    late Widget tableWidget;
                    if (state is EmployeesLoading) {
                      tableWidget = const Center(
                        child: LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      );
                    } else if (state is EmployeesError) {
                      tableWidget = ExceptionWidget(
                        error: state.error,
                        onRetry: () =>
                            context.read<EmployeesBloc>().add(ListEmployees()),
                      );
                    } else if (state is EmployeesLoaded) {
                      tableWidget = SizedBox(
                        height: context.height,
                        width: context.width,
                        child: state.employees.where(passesRole).isNotEmpty
                            ? SingleChildScrollView(
                                child: Table(
                                  border: tableBorder,
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
                                    ...state.employees.where(passesRole).map(
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
                                              TableBodyItem(
                                                  e.registeredAt.name),
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
                                                    tooltipText:
                                                        'Edit Information',
                                                    color: UtanoColors.green,
                                                  ),
                                                  TableAction(
                                                    icon: CupertinoIcons.delete,
                                                    tooltipText:
                                                        'Delete From System',
                                                    color: UtanoColors.red,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                  ],
                                ),
                              )
                            : Center(
                                child: Text(
                                  'Unfortunately no employees matching selected'
                                  ' role ☹️',
                                  style: TextStyle(
                                    color: UtanoColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: sy(12),
                                  ),
                                ),
                              ),
                      );
                    } else {
                      tableWidget = const SizedBox.shrink();
                    }

                    return tableWidget;
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
