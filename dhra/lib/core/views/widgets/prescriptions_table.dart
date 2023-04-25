//
//  prescriptions_table
//  dhra
//
//  Created by Ngonidzashe Mangudya on 25/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dhra/core/views/widgets/table_actions_row.dart';
import 'package:dhra/core/views/widgets/table_body_item.dart';
import 'package:dhra/core/views/widgets/table_header_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/prescriptions/prescriptions_bloc.dart';
import '../../configs/colors.dart';
import '../../models/utils/table_action.dart';
import '../../utils/constants.dart';
import 'exception_widget.dart';
import 'loader_widget.dart';

class PrescriptionsTable extends StatelessWidget {
  const PrescriptionsTable({super.key});

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
                    'Prescriptions',
                    style: TextStyle(
                      color: UtanoColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(12),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context
                        .read<PrescriptionsBloc>()
                        .add(ListPrescriptions()),
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
                child: BlocBuilder<PrescriptionsBloc, PrescriptionsState>(
                  builder: (context, state) {
                    late Widget tableWidget;
                    if (state is PrescriptionsLoading) {
                      tableWidget = const Center(
                        child: LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      );
                    } else if (state is PrescriptionsError) {
                      tableWidget = ExceptionWidget(
                        error: state.error,
                        onRetry: () => context
                            .read<PrescriptionsBloc>()
                            .add(ListPrescriptions()),
                      );
                    } else if (state is PrescriptionsLoaded) {
                      tableWidget = SizedBox(
                        height: context.height,
                        width: context.width,
                        child: state.prescriptions.isNotEmpty
                            ? Table(
                                border: tableBorder,
                                children: [
                                  const TableRow(
                                    children: [
                                      TableHeaderTitle(
                                        title: 'Prescription #',
                                      ),
                                      TableHeaderTitle(
                                        title: 'Patient',
                                      ),
                                      TableHeaderTitle(
                                        title: 'Items',
                                      ),
                                      TableHeaderTitle(
                                        title: 'Date',
                                      ),
                                      TableHeaderTitle(
                                        title: 'Actions',
                                      ),
                                    ],
                                  ),
                                  ...state.prescriptions.map(
                                    (e) => TableRow(
                                      children: [
                                        TableBodyItem(
                                          e.prescriptionNumber,
                                        ),
                                        TableBodyItem(
                                          e.patient,
                                        ),
                                        TableBodyItem(
                                          '${e.prescriptionItems.map(
                                            (i) =>
                                                '${i.medicine} - ${i.quantity}'
                                                ' @ ${i.frequency}/d\n',
                                          )}',
                                        ),
                                        TableBodyItem(
                                          e.createdAt.readableDateTime,
                                        ),
                                        TableActionsRow(
                                          actions: const [
                                            TableAction(
                                              icon: CupertinoIcons.eye,
                                              tooltipText: 'View Prescription',
                                              color: UtanoColors.active,
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
                                    'No Prescriptions Found',
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
