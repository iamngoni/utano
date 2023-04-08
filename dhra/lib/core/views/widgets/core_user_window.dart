//
//  core_user_window
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../general/blocs/auth/auth_bloc.dart';
import '../../../general/blocs/navigation/navigation_bloc.dart';
import '../../../general/views/pages/landing.dart';
import '../../configs/colors.dart';
import 'core_side_bar.dart';
import 'side_bar_tab_item.dart';

class CoreUserWindow extends StatelessWidget {
  const CoreUserWindow({
    required this.sideBarItems,
    required this.sideBarBottomTabItems,
    super.key,
  });

  final List<SideBarTabItem> sideBarItems;
  final List<SideBarTabItem> sideBarBottomTabItems;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return MacosWindow(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                context.goToRefresh(page: const LandingPage());
              }
            },
            child: SizedBox(
              height: context.height,
              width: context.width,
              child: Row(
                children: [
                  CoreSideBar(
                    sideBarTabItems: sideBarItems,
                    sideBarBottomTabItems: sideBarBottomTabItems,
                  ),
                  Expanded(
                    child: BlocBuilder<NavigationBloc, NavigationState>(
                      builder: (context, state) {
                        if (state is! Navigation) {
                          return Center(
                            child: Image(
                              image: const AssetImage(
                                'assets/images/logo-red.png',
                              ),
                              height: sy(100),
                            ),
                          );
                        }

                        return Container(
                          height: context.height,
                          width: context.width,
                          color: UtanoColors.background,
                          padding: EdgeInsets.symmetric(
                            horizontal: sx(20),
                            vertical: sy(40),
                          ),
                          child: context
                              .read<NavigationBloc>()
                              .screens[state.index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
