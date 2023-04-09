//
//  no_health_institution_selected_widget
//  dhra
//
//  Created by Ngonidzashe Mangudya on 9/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/blocs/dropdown_button/dropdown_button_bloc.dart';
import '../../../core/configs/colors.dart';
import '../../../core/models/data/health_institution.dart';
import '../../../core/services/di.dart';
import '../../../core/services/notifications.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/utano_button.dart';
import '../../../core/views/widgets/utano_dropdown_button.dart';
import '../../blocs/health_institution_employees/health_institution_employees_bloc.dart';
import '../../blocs/health_institutions/health_institutions_bloc.dart';

class NoHealthInstitutionSelectedWidget extends StatefulWidget {
  const NoHealthInstitutionSelectedWidget({
    super.key,
  });

  @override
  State<NoHealthInstitutionSelectedWidget> createState() =>
      _NoHealthInstitutionSelectedWidgetState();
}

class _NoHealthInstitutionSelectedWidgetState
    extends State<NoHealthInstitutionSelectedWidget> {
  HealthInstitution? healthInstitution;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Health Institution',
                    style: TextStyle(
                      color: UtanoColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(12),
                    ),
                  ),
                  SizedBox(
                    height: sy(7),
                  ),
                  BlocBuilder<HealthInstitutionsBloc, HealthInstitutionsState>(
                    builder: (context, state) {
                      late Widget dropdownWidget;

                      if (state is HealthInstitutionsLoading) {
                        dropdownWidget = const Center(
                          child: LoaderWidget(
                            color: UtanoColors.black,
                          ),
                        );
                      } else if (state is HealthInstitutionsError) {
                        dropdownWidget = const Center(
                          child: Text('Failed to load institutions. Retry'),
                        );
                      } else if (state is HealthInstitutionsLoaded) {
                        dropdownWidget =
                            BlocProvider<DropdownButtonBloc<HealthInstitution>>(
                          create: (context) =>
                              DropdownButtonBloc<HealthInstitution>(),
                          child: Builder(
                            builder: (context) {
                              return SizedBox(
                                height: sy(30),
                                width: context.width,
                                child: UtanoDropdownButton<HealthInstitution>(
                                  title: 'Health Institution',
                                  items: state.healthInstitutions,
                                  onChanged:
                                      (HealthInstitution? healthInstitution) {
                                    setState(() {
                                      this.healthInstitution =
                                          healthInstitution;
                                    });
                                  },
                                  value: healthInstitution,
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        dropdownWidget =
                            const Center(child: Text('Load configs'));
                      }

                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: dropdownWidget,
                      );
                    },
                  ),
                  SizedBox(
                    height: sy(15),
                  ),
                  UtanoButton(
                    onTap: () {
                      if (healthInstitution == null) {
                        di<NotificationsService>().showErrorNotification(
                          title: 'Error',
                          message: 'Select health institution!',
                        );
                        return;
                      }

                      context.read<HealthInstitutionEmployeesBloc>().add(
                            ListHealthInstitutionEmployees(healthInstitution!),
                          );
                    },
                    text: 'LIST EMPLOYEES',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
