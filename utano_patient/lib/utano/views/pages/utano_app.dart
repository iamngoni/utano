//
//  utano_app
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 4/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';

class UtanoApplication extends StatelessWidget {
  const UtanoApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: UtanoColors.primary,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/home.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/notifications.png')),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/desk.png')),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/user.png')),
              label: 'Profile',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: ImageIcon(
            AssetImage('assets/icons/stethoscope.png'),
            color: UtanoColors.light,
          ),
          backgroundColor: UtanoColors.primary,
          // make it totally circular,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          // increase radius
          elevation: 3,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
