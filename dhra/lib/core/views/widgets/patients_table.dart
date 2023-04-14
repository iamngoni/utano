//
//  patients_table
//  dhra
//
//  Created by Ngonidzashe Mangudya on 13/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/patients/patients_bloc.dart';
import '../../configs/colors.dart';
import '../../models/utils/table_action.dart';
import 'exception_widget.dart';
import 'loader_widget.dart';
import 'table_actions_row.dart';
import 'table_body_item.dart';
import 'table_header_title.dart';

class PatientsTable extends StatelessWidget {
  const PatientsTable({
    super.key,
  });

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
                    'Patients',
                    style: TextStyle(
                      color: UtanoColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(12),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.read<PatientsBloc>().add(const ListPatients()),
                    child: Icon(
                      CupertinoIcons.refresh_thick,
                      color: UtanoColors.grey,
                      size: sy(15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sy(20),
              ),
              Expanded(
                child: BlocBuilder<PatientsBloc, PatientsState>(
                  builder: (context, state) {
                    late Widget tableWidget;
                    if (state is PatientsLoading) {
                      tableWidget = const Center(
                        child: LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      );
                    } else if (state is PatientsError) {
                      tableWidget = ExceptionWidget(
                        error: state.error,
                        onRetry: () =>
                            context.read<PatientsBloc>().add(ListPatients()),
                      );
                    } else if (state is PatientsLoaded) {
                      tableWidget = SizedBox(
                        height: context.height,
                        width: context.width,
                        child: state.patients.isNotEmpty
                            ? Table(
                                children: [
                                  const TableRow(
                                    children: [
                                      TableHeaderTitle(
                                        title: 'Record\n#',
                                      ),
                                      TableHeaderTitle(
                                        title: 'Full\nName',
                                      ),
                                      TableHeaderTitle(
                                        title: 'Mobile\nNumber',
                                      ),
                                      TableHeaderTitle(
                                        title: 'National\nID',
                                      ),
                                      TableHeaderTitle(
                                        title: 'Marital\nStatus',
                                      ),
                                      TableHeaderTitle(
                                        title: 'Work\nStatus',
                                      ),
                                      TableHeaderTitle(
                                        title: 'Place of\nBirth',
                                      ),
                                      TableHeaderTitle(title: 'Blood\nType'),
                                      TableHeaderTitle(title: 'Date of\nBirth'),
                                      TableHeaderTitle(
                                        title: '\nActions',
                                      ),
                                    ],
                                  ),
                                  ...state.patients.map(
                                    (e) => TableRow(
                                      children: [
                                        TableBodyItem(
                                          e.medicalRecordNumber,
                                        ),
                                        TableBodyItem(
                                          '${e.user.firstName} ${e.user.lastName}',
                                        ),
                                        TableBodyItem(
                                          e.mobileNumber ?? 'n/a',
                                        ),
                                        TableBodyItem(
                                          e.nationalIdNumber ?? 'n/a',
                                        ),
                                        TableBodyItem(
                                          e.maritalStatus ?? 'n/a',
                                        ),
                                        TableBodyItem(
                                          e.employmentStatus ?? 'n/a',
                                        ),
                                        TableBodyItem(
                                          e.placeOfBirth,
                                        ),
                                        TableBodyItem(
                                          e.bloodType,
                                        ),
                                        TableBodyItem(
                                          '${e.dateOfBirth?.readableDate}',
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
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    'assets/lottie/nothing.json',
                                    height: sy(200),
                                    width: sy(200),
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: sy(10),
                                  ),
                                  Text(
                                    'No Patients Found',
                                    style: TextStyle(
                                      color: UtanoColors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: sy(12),
                                    ),
                                  ),
                                ],
                              ),
                      );
                    } else {
                      tableWidget = const SizedBox.shrink();
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: tableWidget,
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
