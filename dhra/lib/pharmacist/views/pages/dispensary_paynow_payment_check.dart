//
//  dispensary_paynow_payment_check
//  dhra
//
//  Created by Ngonidzashe Mangudya on 1/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:paynow/paynow.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/application_error.dart';
import '../../../core/views/widgets/exception_widget.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/page_header.dart';
import '../../../core/views/widgets/utano_button.dart';
import '../../../general/blocs/navigation/navigation_bloc.dart';
import '../../blocs/dispensary/dispensary_bloc.dart';
import '../../blocs/dispensary_payment/dispensary_payment_bloc.dart';

class DispensaryPaynowPaymentCheckPage extends StatelessWidget {
  DispensaryPaynowPaymentCheckPage({super.key});

  final Paynow paynow = Paynow(
    integrationId: '8379',
    integrationKey: 'a671ff85-94dc-4613-93f2-9d3de0f5d5ff',
    returnUrl: '',
    resultUrl: '',
  );

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
                title: 'Paynow Confirmation',
              ),
              SizedBox(
                height: sy(20),
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
                    border: Border.all(
                      color: UtanoColors.border.withOpacity(0.4),
                    ),
                  ),
                  child: StreamBuilder(
                    stream: paynow.streamTransactionStatus(
                      (context.read<DispensaryPaymentBloc>().state
                              as DispensaryPaymentLoaded)
                          .payment
                          .paymentLink,
                      streamInterval: 10,
                    ),
                    builder: (context, snapshot) {
                      while (
                          snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: LoaderWidget(
                            color: UtanoColors.black,
                          ),
                        );
                      }

                      if (snapshot.hasError) {
                        return ExceptionWidget(
                          error: ApplicationError('${snapshot.error}'),
                        );
                      }

                      final StatusResponse? statusResponse = snapshot.data;

                      log(statusResponse.toString());

                      if (statusResponse == null) {
                        return const Center(
                          child: LoaderWidget(
                            color: UtanoColors.black,
                          ),
                        );
                      }

                      if (statusResponse.status == 'Paid') {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Payment Successful',
                              style: TextStyle(
                                color: UtanoColors.green,
                                fontSize: sy(20),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: sy(10),
                            ),
                            UtanoButton(
                              text: 'Back to Dashboard',
                              onTap: () {
                                context
                                    .read<NavigationBloc>()
                                    .add(const Navigate(3));
                                context.read<DispensaryBloc>().add(Reset());
                                context
                                    .read<DispensaryPaymentBloc>()
                                    .add(ResetDispensaryPayment());
                              },
                            ),
                          ],
                        );
                      }

                      return Center(
                        child: Text(
                          'Payment Pending',
                          style: TextStyle(
                            color: UtanoColors.red,
                            fontSize: sy(20),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
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
