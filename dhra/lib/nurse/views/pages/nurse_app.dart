//
//  nurse_home
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/views/widgets/core_user_window.dart';
import '../../../core/views/widgets/side_bar_tab_item.dart';
import '../../../general/blocs/auth/auth_bloc.dart';
import '../../../general/blocs/navigation/navigation_bloc.dart';

class NurseApp extends StatelessWidget {
  const NurseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is! Navigation) {
          return const SizedBox.shrink();
        }
        return CoreUserWindow(
          sideBarItems: [
            SideBarTabItem(
              title: 'Dashboard',
              imageIcon: const AssetImage('assets/icons/pie-chart.png'),
              isActive: state.index == 0,
              onTap: () => context.read<NavigationBloc>().add(
                    const Navigate(0),
                  ),
            ),
            SideBarTabItem(
              title: 'Point of Service',
              imageIcon: const AssetImage('assets/icons/user-add.png'),
              isActive: state.index == 1,
              onTap: () => context.read<NavigationBloc>().add(
                    const Navigate(1),
                  ),
            ),
            SideBarTabItem(
              title: 'Patients',
              imageIcon: const AssetImage('assets/icons/desk.png'),
              isActive: state.index == 2,
              onTap: () => context.read<NavigationBloc>().add(
                    const Navigate(2),
                  ),
            ),
            SideBarTabItem(
              title: 'Prescriptions',
              imageIcon: const AssetImage('assets/icons/database.png'),
              isActive: state.index == 3,
              onTap: () => context.read<NavigationBloc>().add(
                    const Navigate(3),
                  ),
            ),
          ],
          sideBarBottomTabItems: [
            SideBarTabItem(
              title: 'Change Password',
              imageIcon: const AssetImage('assets/icons/lock.png'),
              isActive: state.index == 4,
              onTap: () => context.read<NavigationBloc>().add(
                    const Navigate(4),
                  ),
            ),
            SideBarTabItem(
              title: 'Logout',
              imageIcon: const AssetImage('assets/icons/out.png'),
              onTap: () => context.read<AuthBloc>().add(AuthLogout()),
            ),
          ],
        );
      },
    );
  }
}
