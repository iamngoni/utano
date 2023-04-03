//
//  nurse_home
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';

import '../../../core/widgets/core_user_window.dart';
import '../../../core/widgets/side_bar_tab_item.dart';

class NurseApp extends StatelessWidget {
  const NurseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoreUserWindow(
      sideBarItems: [
        SideBarTabItem(
          title: 'Dashboard',
          imageIcon: AssetImage('assets/icons/pie-chart.png'),
          isActive: true,
        ),
        SideBarTabItem(
          title: 'Point of Service',
          imageIcon: AssetImage('assets/icons/user-add.png'),
        ),
        SideBarTabItem(
          title: 'Patients',
          imageIcon: AssetImage('assets/icons/desk.png'),
        ),
        SideBarTabItem(
          title: 'Prescriptions',
          imageIcon: AssetImage('assets/icons/database.png'),
        ),
      ],
      sideBarBottomTabItems: [
        SideBarTabItem(
          title: 'Change Password',
          imageIcon: AssetImage('assets/icons/lock.png'),
        ),
        SideBarTabItem(
          title: 'Logout',
          imageIcon: AssetImage('assets/icons/out.png'),
        ),
      ],
    );
  }
}
