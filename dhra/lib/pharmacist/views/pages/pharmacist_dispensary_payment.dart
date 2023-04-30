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
import 'package:relative_scale/relative_scale.dart';

import '../../../core/blocs/system_configs/system_configs_bloc.dart';
import '../../../core/configs/colors.dart';
import '../../../core/views/widgets/page_header.dart';
import '../../blocs/dispensary/dispensary_bloc.dart';

class PharmacistDispensaryPaymentPage extends StatelessWidget {
  const PharmacistDispensaryPaymentPage({super.key});

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
                                  BlocBuilder<SystemConfigsBloc,
                                      SystemConfigsState>(
                                    builder: (context, state) {
                                      late Widget dropdownWidget;

                                      if (state is SystemConfigsLoading) {
                                        dropdownWidget = const Center(
                                          child: LoaderWidget(
                                            color: UtanoColors.black,
                                            radius: 7,
                                          ),
                                        );
                                      } else if (state is SystemConfigsError) {
                                        dropdownWidget = Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<SystemConfigsBloc>()
                                                  .add(LoadSystemConfigs());
                                            },
                                            child: const Text(
                                              'Failed to load configs. Retry',
                                            ),
                                          ),
                                        );
                                      } else if (state is SystemConfigsLoaded) {
                                        dropdownWidget = BlocProvider<
                                            DropdownButtonBloc<Gender>>(
                                          create: (context) =>
                                              DropdownButtonBloc<Gender>(),
                                          child: Builder(
                                            builder: (context) {
                                              return SizedBox(
                                                height: sy(30),
                                                width: context.width,
                                                child:
                                                    UtanoDropdownButton<Gender>(
                                                  title: 'Gender',
                                                  items: state.genders,
                                                  onChanged:
                                                      widget._onUpdateGender,
                                                  value: widget._gender,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        dropdownWidget = Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<SystemConfigsBloc>()
                                                  .add(LoadSystemConfigs());
                                            },
                                            child: const Text('Load configs'),
                                          ),
                                        );
                                      }

                                      return dropdownWidget;
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
              ),
            ],
          ),
        );
      },
    );
  }
}
