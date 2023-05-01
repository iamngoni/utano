//
//  pharmacist_dispensary_payment
//  dhra
//
//  Created by Ngonidzashe Mangudya on 1/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:localregex/localregex.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/blocs/dropdown_button/dropdown_button_bloc.dart';
import '../../../core/configs/colors.dart';
import '../../../core/models/data/payment_method.dart';
import '../../../core/services/di.dart';
import '../../../core/services/notifications.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/page_header.dart';
import '../../../core/views/widgets/utano_button.dart';
import '../../../core/views/widgets/utano_dropdown_button.dart';
import '../../../core/views/widgets/utano_text_field.dart';
import '../../../general/blocs/navigation/navigation_bloc.dart';
import '../../blocs/dispensary/dispensary_bloc.dart';
import '../../blocs/dispensary_payment/dispensary_payment_bloc.dart';

class PharmacistDispensaryPaymentPage extends StatefulWidget {
  const PharmacistDispensaryPaymentPage({super.key});

  @override
  State<PharmacistDispensaryPaymentPage> createState() =>
      _PharmacistDispensaryPaymentPageState();
}

class _PharmacistDispensaryPaymentPageState
    extends State<PharmacistDispensaryPaymentPage> {
  PaymentMethod? paymentMethod;
  final TextEditingController mobileNumberController = TextEditingController();

  void onUpdatePaymentMethod(PaymentMethod? method) {
    if (method != null) {
      setState(() {
        paymentMethod = method;
      });
    }
  }

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
                title: 'Dispensary Payment',
              ),
              SizedBox(
                height: sy(20),
              ),
              Container(
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
                child: BlocBuilder<DispensaryBloc, DispensaryState>(
                  builder: (context, state) {
                    if (state is DispensaryInitial) {
                      if (state.dispense != null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Method',
                                  style: TextStyle(
                                    color: UtanoColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: sy(12),
                                  ),
                                ),
                                SizedBox(
                                  height: sy(7),
                                ),
                                BlocProvider<DropdownButtonBloc<PaymentMethod>>(
                                  create: (context) =>
                                      DropdownButtonBloc<PaymentMethod>(),
                                  child: Builder(
                                    builder: (context) {
                                      return SizedBox(
                                        height: sy(30),
                                        width: context.width,
                                        child:
                                            UtanoDropdownButton<PaymentMethod>(
                                          title: 'Method of Payment',
                                          items: PaymentMethod.values,
                                          onChanged: onUpdatePaymentMethod,
                                          value: paymentMethod,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                if ([
                                  PaymentMethod.onemoney,
                                  PaymentMethod.ecocash
                                ].contains(paymentMethod))
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: sy(10),
                                      ),
                                      UtanoTextField(
                                        label: 'Payment Phone'
                                            ' (${paymentMethod?.name})',
                                        placeholder: paymentMethod ==
                                                PaymentMethod.ecocash
                                            ? '0777213388'
                                            : '0713700601',
                                        keyboardType: TextInputType.phone,
                                        controller: mobileNumberController,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Mobile number is required';
                                          }

                                          if (paymentMethod ==
                                              PaymentMethod.ecocash) {
                                            if (!LocalRegex.isEconet(value)) {
                                              return 'Not a valid Econet'
                                                  ' number';
                                            }
                                          } else {
                                            if (!LocalRegex.isNetone(value)) {
                                              return 'Not a valid Netone'
                                                  ' number';
                                            }
                                          }

                                          return null;
                                        },
                                      ),
                                    ],
                                  )
                                else
                                  const SizedBox.shrink(),
                                SizedBox(
                                  height: sy(10),
                                ),
                                BlocBuilder<DispensaryPaymentBloc,
                                    DispensaryPaymentState>(
                                  builder: (context, dState) {
                                    if (dState is DispensaryPaymentLoading) {
                                      return const LoaderWidget(
                                        color: UtanoColors.black,
                                      );
                                    }

                                    if (dState is DispensaryPaymentLoaded) {
                                      if ([
                                        PaymentMethod.ecocash,
                                        PaymentMethod.onemoney
                                      ].contains(
                                          dState.payment.paymentMethod)) {
                                        return UtanoButton(
                                          text: 'LISTEN FOR PAYMENT UPDATE',
                                          onTap: () => context
                                              .read<NavigationBloc>()
                                              .add(const Navigate(8)),
                                        );
                                      }

                                      return const Text('Complete');
                                    }

                                    return UtanoButton(
                                      text: paymentMethod == PaymentMethod.cash
                                          ? 'Pay \$${state.dispense?.totalCost.toStringAsFixed(2)}'
                                          : 'Pay \$${state.dispense?.totalRtgsCost.toStringAsFixed(2)}',
                                      onTap: () {
                                        if (paymentMethod == null) {
                                          di<NotificationsService>()
                                              .showErrorNotification(
                                            title: 'Payment Method',
                                            message:
                                                'Select payment method to continue',
                                          );
                                          return;
                                        }

                                        if ([
                                          PaymentMethod.onemoney,
                                          PaymentMethod.ecocash
                                        ].contains(paymentMethod)) {
                                          if (mobileNumberController
                                              .text.isEmpty) {
                                            di<NotificationsService>()
                                                .showErrorNotification(
                                              title: 'Mobile Number',
                                              message:
                                                  'Enter mobile number responsible for payment',
                                            );
                                            return;
                                          }

                                          if (paymentMethod ==
                                              PaymentMethod.ecocash) {
                                            if (!LocalRegex.isEconet(
                                                mobileNumberController.text)) {
                                              di<NotificationsService>()
                                                  .showErrorNotification(
                                                title: 'Mobile Number',
                                                message:
                                                    'Mobile number is not a valid Econet number',
                                              );
                                              return;
                                            }
                                          } else {
                                            if (!LocalRegex.isNetone(
                                                mobileNumberController.text)) {
                                              di<NotificationsService>()
                                                  .showErrorNotification(
                                                title: 'Mobile Number',
                                                message:
                                                    'Mobile number is not a valid Netone number',
                                              );
                                              return;
                                            }
                                          }
                                        }

                                        context
                                            .read<DispensaryPaymentBloc>()
                                            .add(
                                              PayForDispensaryItems(
                                                state.dispense!,
                                                paymentMethod!,
                                                mobileNumber:
                                                    mobileNumberController.text,
                                              ),
                                            );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    } else {
                      return const SizedBox.shrink();
                    }
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
