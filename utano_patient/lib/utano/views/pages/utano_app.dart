//
//  utano_app
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 4/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';
import 'profile.dart';

import '../../../core/configs/colors.dart';
import 'history.dart';
import 'home.dart';
import 'notifications.dart';

class UtanoApplication extends StatefulWidget {
  UtanoApplication({super.key});

  @override
  State<UtanoApplication> createState() => _UtanoApplicationState();
}

class _UtanoApplicationState extends State<UtanoApplication> {
  final List<Widget> pages = [
    HomePage(),
    NotificationsPage(),
    const SizedBox.shrink(),
    HistoryPage(),
    ProfilePage(),
  ];

  final PageController pageController = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: UtanoColors.primary,
          title: Image(
            image: AssetImage('assets/images/logo-red.png'),
            height: sy(20),
          ),
        ),
        body: Container(
          height: context.height,
          width: context.width,
          child: PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (int? x) {
            if (x != null) {
              setState(() {
                index = x;
              });
              pageController.animateToPage(
                x,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
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
