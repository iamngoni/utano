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

import '../../../core/blocs/file_picker/file_picker_bloc.dart';
import '../../../core/configs/configs.dart';
import '../../../core/views/widgets/active_tab_indicator.dart';
import '../../../core/views/widgets/page_header.dart';
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
        return SizedBox(
          height: context.height,
          width: context.width,
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
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    const HealthInstitutionsTable(),
                    BlocProvider(
                      create: (context) => FilePickerBloc(),
                      child: const HealthInstitutionsRegistrationForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
