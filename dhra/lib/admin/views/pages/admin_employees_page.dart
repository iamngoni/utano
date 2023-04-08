//
//  admin_employees_page
//  dhra
//
//  Created by Ngonidzashe Mangudya on 7/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/models/data/user_role.dart';
import '../../../core/views/widgets/active_tab_indicator.dart';
import '../../../core/views/widgets/page_header.dart';
import '../widgets/employees_table.dart';

class AdminEmployeesPage extends StatefulWidget {
  const AdminEmployeesPage({super.key});

  @override
  State<AdminEmployeesPage> createState() => _AdminEmployeesPageState();
}

class _AdminEmployeesPageState extends State<AdminEmployeesPage> {
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
                title: 'Employees',
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
                            'All Employees',
                            style: TextStyle(
                              color: UtanoColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(10),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Admins',
                            style: TextStyle(
                              color: UtanoColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(10),
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
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _changeCurrentTab(2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Doctors',
                            style: TextStyle(
                              color: UtanoColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(10),
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: const ActiveTabIndicator(),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: index == 2
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
                      onTap: () => _changeCurrentTab(3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nurses',
                            style: TextStyle(
                              color: UtanoColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(10),
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: const ActiveTabIndicator(),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: index == 3
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
                      onTap: () => _changeCurrentTab(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lab Technicians',
                            style: TextStyle(
                              color: UtanoColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(10),
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: const ActiveTabIndicator(),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: index == 4
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
                      onTap: () => _changeCurrentTab(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pharmacists',
                            style: TextStyle(
                              color: UtanoColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(10),
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: const ActiveTabIndicator(),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: index == 5
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
                  children: const [
                    EmployeesTable(),
                    EmployeesTable(
                      role: UserRole.admin,
                    ),
                    EmployeesTable(
                      role: UserRole.doctor,
                    ),
                    EmployeesTable(
                      role: UserRole.nurse,
                    ),
                    EmployeesTable(
                      role: UserRole.labTechnician,
                    ),
                    EmployeesTable(
                      role: UserRole.pharmacist,
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
