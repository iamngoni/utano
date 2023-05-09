import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/widgets/loader_widget.dart';
import '../../blocs/check_in/check_in_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        height: context.height,
        width: context.width,
        child:
            BlocBuilder<CheckInBloc, CheckInState>(builder: (context, state) {
          if (state is CheckInLoading) {
            return Center(
              child: LoaderWidget(),
            );
          }

          if (state is CheckInLoaded) {
            log('here');
            return ListView(
              children: state.checkIns
                  .map(
                    (e) => ListTile(
                      tileColor: state.checkIns.indexOf(e).isEven
                          ? Colors.white
                          : UtanoColors.light,
                      title: Text(
                        '${e.createdAt.readableDate}'
                        ' at ${e.createdAt.readableTime}',
                        style: TextStyle(
                          color: UtanoColors.dark,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(9),
                        ),
                      ),
                      subtitle: Text(
                        'Temperature: ${e.temperature}, Diastolic BP: ${e.diastolicBloodPressure}, Systolic BP: ${e.systolicBloodPressure}, Pulse: ${e.pulse}, Respiratory Rate: ${e.respiratoryRate}',
                        style: TextStyle(
                          color: UtanoColors.dark.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: sy(8),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          }

          if (state is CheckInFailure) {
            return Center(
              child: GestureDetector(
                onTap: () => context.read<CheckInBloc>().add(ListCheckIns()),
                child: Text('${state.exception.message}'),
              ),
            );
          }

          return Center(
            child: Text('No items'),
          );
        }),
      );
    });
  }
}
