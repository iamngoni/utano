//
//  system_admin_health_institutions
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/configs.dart';
import '../../../core/views/widgets/active_tab_indicator.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/page_header.dart';
import '../../blocs/health_institutions/health_institutions_bloc.dart';
import '../widgets/health_institutions_registration_form.dart';
import '../widgets/health_institutions_table.dart';

class SystemAdminHealthInstitutionsPage extends StatefulWidget {
  const SystemAdminHealthInstitutionsPage({super.key});

  @override
  State<SystemAdminHealthInstitutionsPage> createState() =>
      _SystemAdminHealthInstitutionsPageState();
}

class _SystemAdminHealthInstitutionsPageState
    extends State<SystemAdminHealthInstitutionsPage> {
  final PageController pageController = PageController();
  int index = 0;

  void _changeCurrentTab(int index) {
    setState(() {
      this.index = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: context.height,
          width: context.width,
          color: UtanoColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: 'Health Institutions',
              ),
              SizedBox(
                height: sy(20),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _changeCurrentTab(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Health Institutions',
                            style: TextStyle(
                              color: UtanoColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(12),
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: const ActiveTabIndicator(),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: index == 0
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 200),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _changeCurrentTab(1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Register Health Institution',
                            style: TextStyle(
                              color: UtanoColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(12),
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: const ActiveTabIndicator(),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: index == 1
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 200),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sy(20),
              ),
              Expanded(
                child: BlocBuilder<HealthInstitutionsBloc,
                    HealthInstitutionsState>(
                  builder: (context, state) {
                    late Widget healthInstitutionsWidget;

                    if (state is HealthInstitutionsError) {
                      healthInstitutionsWidget = Center(
                        child: Text(state.error.message),
                      );
                    } else if (state is HealthInstitutionsLoading) {
                      healthInstitutionsWidget = const LoaderWidget(
                        color: UtanoColors.black,
                      );
                    } else if (state is HealthInstitutionsLoaded) {
                      healthInstitutionsWidget = PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          HealthInstitutionsTable(
                            healthInstitutions: state.healthInstitutions,
                          ),
                          HealthInstitutionsRegistrationForm(),
                        ],
                      );
                    } else {
                      healthInstitutionsWidget = const LoaderWidget(
                        color: UtanoColors.black,
                      );
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: healthInstitutionsWidget,
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
