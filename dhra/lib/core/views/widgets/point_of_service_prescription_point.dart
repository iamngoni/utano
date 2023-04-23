//
//  point_of_service_prescription_point
//  dhra
//
//  Created by Ngonidzashe Mangudya on 22/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/approved_medicine/approved_medicines_bloc.dart';
import '../../configs/colors.dart';
import 'exception_widget.dart';
import 'loader_widget.dart';
import 'point_of_service_prescription_point_approved_medicines_loaded_widget.dart';
import 'utano_button.dart';

class PointOfServicePrescriptionPoint extends StatelessWidget {
  const PointOfServicePrescriptionPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: context.width,
          decoration: BoxDecoration(
            color: UtanoColors.white,
            border: Border.all(
              color: UtanoColors.border.withOpacity(0.4),
            ),
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
          child: BlocBuilder<ApprovedMedicinesBloc, ApprovedMedicinesState>(
            builder: (context, state) {
              late Widget child;
              if (state is ApprovedMedicinesLoading) {
                child = const Center(
                  child: LoaderWidget(
                    color: UtanoColors.black,
                  ),
                );
              } else if (state is ApprovedMedicinesError) {
                child = ExceptionWidget(error: state.error);
              } else if (state is ApprovedMedicinesLoaded) {
                child =
                    PointOfServicePrescriptionPointApprovedMedicinesLoadedWidget(
                  medicines: state.medicines,
                );
              } else {
                child = Center(
                  child: UtanoButton(
                    text: 'Load Approved Medicines',
                    onTap: () => context.read<ApprovedMedicinesBloc>().add(
                          ListApprovedMedicines(),
                        ),
                  ),
                );
              }

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
