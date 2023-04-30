//
//  approved_medicines_table
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../pharmacist/blocs/drugs/drugs_bloc.dart';
import '../../blocs/approved_medicine/approved_medicines_bloc.dart';
import '../../configs/colors.dart';
import '../../models/utils/table_action.dart';
import 'exception_widget.dart';
import 'loader_widget.dart';
import 'no_content_widget.dart';
import 'utano_table.dart';

class ApprovedMedicinesTable extends StatelessWidget {
  const ApprovedMedicinesTable({super.key});

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
                    'Approved Medicines',
                    style: TextStyle(
                      color: UtanoColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(12),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.read<DrugsBloc>().add(ListDrugs()),
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
                child:
                    BlocBuilder<ApprovedMedicinesBloc, ApprovedMedicinesState>(
                  builder: (context, state) {
                    late Widget tableWidget;
                    if (state is ApprovedMedicinesLoading) {
                      tableWidget = const Center(
                        child: LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      );
                    } else if (state is ApprovedMedicinesError) {
                      tableWidget = ExceptionWidget(
                        error: state.error,
                        onRetry: () => context
                            .read<ApprovedMedicinesBloc>()
                            .add(ListApprovedMedicines()),
                      );
                    } else if (state is ApprovedMedicinesLoaded) {
                      tableWidget = SizedBox(
                        height: context.height,
                        width: context.width,
                        child: state.medicines.isNotEmpty
                            ? SingleChildScrollView(
                                child: UtanoTable(
                                  items: state.medicines,
                                  modelFields: const [
                                    'name',
                                    'description',
                                  ],
                                  titles: const [
                                    'Name',
                                    'Description',
                                  ],
                                  actions: const [
                                    TableAction(
                                      icon: CupertinoIcons.eye,
                                      tooltipText: 'Cannot View Medicine',
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const NoContentWidget(),
                                  SizedBox(
                                    height: sy(10),
                                  ),
                                  Text(
                                    'No drugs Found',
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
