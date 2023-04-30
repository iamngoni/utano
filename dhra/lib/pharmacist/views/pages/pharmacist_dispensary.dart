//
//  pharmacist_dispensary
//  dhra
//
//  Created by Ngonidzashe Mangudya on 30/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/services/di.dart';
import '../../../core/services/notifications.dart';
import '../../../core/views/widgets/exception_widget.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/no_content_widget.dart';
import '../../../core/views/widgets/page_header.dart';
import '../../../general/blocs/navigation/navigation_bloc.dart';
import '../../blocs/dispensary/dispensary_bloc.dart';
import '../widgets/dispensary_area.dart';
import '../widgets/dispensary_prescription_search.dart';

class PharmacistDispensaryPage extends StatelessWidget {
  const PharmacistDispensaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: 'Dispensary',
              ),
              SizedBox(
                height: sy(20),
              ),
              DispensaryPrescriptionSearch(),
              SizedBox(
                height: sy(10),
              ),
              Expanded(
                child: Container(
                  height: context.height,
                  width: context.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: sx(10),
                    vertical: sy(20),
                  ),
                  decoration: BoxDecoration(
                    color: UtanoColors.white,
                    border:
                        Border.all(color: UtanoColors.border.withOpacity(0.4)),
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
                  child: BlocConsumer<DispensaryBloc, DispensaryState>(
                    listener: (context, state) {
                      if (state is DispensaryInitial) {
                        if (state.dispense != null) {
                          di<NotificationsService>().showSuccesssNotification(
                            title: 'Success',
                            message: 'Complete Payment For Item',
                          );
                          context.read<NavigationBloc>().add(
                                const Navigate(7),
                              );
                        }
                      }
                    },
                    builder: (context, state) {
                      late Widget dispensaryWidget;

                      if (state is DispensaryLoading) {
                        dispensaryWidget = const Center(
                          child: LoaderWidget(
                            color: UtanoColors.black,
                          ),
                        );
                      } else if (state is DispensaryError) {
                        dispensaryWidget = ExceptionWidget(
                          error: state.error,
                          onRetry: () =>
                              context.read<DispensaryBloc>().add(Reset()),
                        );
                      } else if (state is DispensaryLoaded) {
                        dispensaryWidget = DispensaryArea(
                          prescription: state.prescription,
                        );
                      } else {
                        dispensaryWidget = Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(child: NoContentWidget()),
                            Text(
                              'Look for a prescription to process above',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      }

                      return dispensaryWidget;
                    },
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
