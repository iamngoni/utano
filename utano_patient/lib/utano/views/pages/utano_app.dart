//
//  utano_app
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 4/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../widgets/consult_doctor_card.dart';
import '../widgets/diagnostics_card.dart';
import '../widgets/health_institutions_card.dart';

class UtanoApplication extends StatelessWidget {
  UtanoApplication({super.key});

  final List<Map<String, String>> topics = [
    {'Women\'s Health': ''},
    {'Skin & Hair': ''},
    {'Mental Health': ''},
    {'Heart Health': ''},
    {'Men\'s Health': ''},
    {'Children\'s Health': ''},
    {'Pregnancy': ''},
    {'Sexual Health': ''},
    {'Diet & Fitness': ''},
    {'Cancer': ''},
    {'Diabetes': ''},
    {'General Physician': ''},
    {'Digestion': ''},
    {'Psychiatrist': ''},
    {'Sexology': ''},
    {'Other': ''},
  ];

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
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: sy(20),
              ),
              ConsultDoctorsCard(),
              SizedBox(
                height: sy(10),
              ),
              Row(
                children: [
                  Expanded(
                    child: DiagnosticsCard(),
                  ),
                  SizedBox(
                    width: sx(20),
                  ),
                  Expanded(
                    child: HealthInstitutionsCard(),
                  ),
                ],
              ),
              SizedBox(
                height: sy(10),
              ),
              Container(
                height: sy(50),
                width: context.width,
                padding: EdgeInsets.symmetric(
                  horizontal: sx(20),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      UtanoColors.orange,
                      UtanoColors.orange.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Lottie.asset(
                      'assets/lottie/prescription.json',
                      height: sy(50),
                      width: sy(50),
                    ),
                    SizedBox(
                      width: sx(10),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Prescriptions',
                            style: TextStyle(
                              color: UtanoColors.light,
                              fontWeight: FontWeight.w600,
                              fontSize: sy(10),
                            ),
                          ),
                          Text(
                            'View your prescriptions',
                            style: TextStyle(
                              color: UtanoColors.light.withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                              fontSize: sy(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Text(
                'General Information',
                style: TextStyle(
                  color: UtanoColors.dark,
                  fontWeight: FontWeight.w600,
                  fontSize: sy(11),
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Expanded(
                child: Wrap(
                  spacing: sx(25),
                  runSpacing: sy(10),
                  alignment: WrapAlignment.spaceBetween,
                  children: topics
                      .map(
                        (t) => Container(
                          height: sy(45),
                          width: sx(80),
                          child: Column(
                            children: [
                              Container(
                                height: sy(35),
                                width: sy(35),
                                decoration: BoxDecoration(
                                  color: UtanoColors.info.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  t.keys.first,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: UtanoColors.dark,
                                    fontWeight: FontWeight.w400,
                                    fontSize: sy(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
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
