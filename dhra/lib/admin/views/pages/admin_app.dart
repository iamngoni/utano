//
//  admin_app
//  dhra
//
//  Created by Ngonidzashe Mangudya on 7/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/views/widgets/core_user_window.dart';
import '../../../core/views/widgets/side_bar_tab_item.dart';
import '../../../general/blocs/auth/auth_bloc.dart';
import '../../../general/blocs/navigation/navigation_bloc.dart';
import '../../blocs/employees/employees_bloc.dart';

class AdminApp extends StatefulWidget {
  const AdminApp({super.key});

  @override
  State<AdminApp> createState() => _AdminAppState();
}

class _AdminAppState extends State<AdminApp> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeesBloc>().add(ListEmployees());
  }

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
              title: 'Employees',
              imageIcon: const AssetImage('assets/icons/database.png'),
              isActive: state.index == 1,
              onTap: () => context.read<NavigationBloc>().add(
                    const Navigate(1),
                  ),
            ),
            SideBarTabItem(
              title: 'Register Employees',
              imageIcon: const AssetImage('assets/icons/user-add.png'),
              isActive: state.index == 2,
              onTap: () => context.read<NavigationBloc>().add(
                    const Navigate(2),
                  ),
            ),
          ],
          sideBarBottomTabItems: [
            SideBarTabItem(
              title: 'Change Password',
              imageIcon: const AssetImage('assets/icons/lock.png'),
              isActive: state.index == 3,
              onTap: () => context.read<NavigationBloc>().add(
                    const Navigate(3),
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
