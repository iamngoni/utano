//
//  core_side_bar
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../general/blocs/auth/auth_bloc.dart';
import '../../configs/colors.dart';
import 'side_bar_tab_item.dart';

class CoreSideBar extends StatelessWidget {
  const CoreSideBar({
    required this.sideBarTabItems,
    required this.sideBarBottomTabItems,
    super.key,
  });

  final List<SideBarTabItem> sideBarTabItems;
  final List<SideBarTabItem> sideBarBottomTabItems;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is! Authenticated) {
              return const SizedBox.shrink();
            }

            return Container(
              width: sx(120),
              height: context.height,
              padding: EdgeInsets.symmetric(
                horizontal: sx(7),
              ),
              color: UtanoColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: sy(50),
                  ),
                  Row(
                    children: [
                      Container(
                        height: sy(35),
                        width: sy(35),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/pp.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sx(7),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.authResponse.user.firstName}'
                              ' ${state.authResponse.user.lastName}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: sy(10),
                              ),
                            ),
                            Text(
                              state.authResponse.user.role.name.titleCase,
                              style: TextStyle(
                                color: UtanoColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  const Divider(
                    color: UtanoColors.border,
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Text(
                    'System Menu',
                    style: TextStyle(
                      color: UtanoColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(10),
                    ),
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Expanded(
                    child: Column(
                      children: [...sideBarTabItems],
                    ),
                  ),
                  Text(
                    'Preferences',
                    style: TextStyle(
                      color: UtanoColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: sy(10),
                    ),
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  ...sideBarBottomTabItems,
                ],
              ),
            );
          },
        );
      },
    );
  }
}
