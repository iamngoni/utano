import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:localregex/localregex.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/widgets/loader_widget.dart';
import '../../blocs/prescriptions/prescriptions_bloc.dart';

class PrescriptionsPage extends StatelessWidget {
  const PrescriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(title: Text('Your Prescriptions')),
          body: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
            ),
            // body -> bloc builder for health institutions bloc
            child: BlocBuilder<PrescriptionsBloc, PrescriptionsState>(
              builder: (context, state) {
                if (state is PrescriptionsLoading) {
                  return Center(
                    child: LoaderWidget(),
                  );
                }

                if (state is PrescriptionsFailure) {
                  return Center(
                    child: GestureDetector(
                        onTap: () => context
                            .read<PrescriptionsBloc>()
                            .add(ListPrescriptions()),
                        child: Text(state.exception.message)),
                  );
                }

                if (state is PrescriptionsLoaded) {
                  return ListView(
                    children: state.prescriptions
                        .map((e) => ListTile(
                              tileColor: state.prescriptions.indexOf(e).isEven
                                  ? Colors.white
                                  : UtanoColors.light,
                              title: Text(
                                '#${e.prescriptionNumber}',
                                style: TextStyle(
                                  color: UtanoColors.dark,
                                  fontWeight: FontWeight.w500,
                                  fontSize: sy(9),
                                ),
                              ),
                              subtitle: Text(
                                "${e.prescriptionItems.map((e) => '${e.medicine} x ${e.quantity} | ').toString()}",
                                style: TextStyle(
                                  color: UtanoColors.dark,
                                  fontWeight: FontWeight.w400,
                                  fontSize: sy(8),
                                ),
                              ),
                            ))
                        .toList(),
                  );
                }

                return SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  }
}
