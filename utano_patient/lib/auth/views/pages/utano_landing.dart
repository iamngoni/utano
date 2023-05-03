//
//  utano_landing
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 3/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/widgets/utano_button.dart';
import '../../../utano/views/pages/utano_app.dart';
import '../../blocs/auth/auth_bloc.dart';
import 'sign_in.dart';
import 'sign_up.dart';

class UtanoLandingPage extends StatelessWidget {
  const UtanoLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.goToRefresh(page: UtanoApplication());
            }
          },
          child: Container(
            height: context.height,
            width: context.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg-1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                height: context.height,
                width: context.width,
                color: Colors.black.withOpacity(0.7),
                padding: EdgeInsets.symmetric(
                  horizontal: sx(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo-red.png'),
                      width: sx(350),
                    ),
                    SizedBox(
                      height: sy(25),
                    ),
                    Text(
                      'A simple and secure way to manage your health records.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(10),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: sy(150),
                    ),
                    UtanoButton(
                      text: 'Get Started',
                      onTap: () => context.goTo(page: SignUpPage()),
                    ),
                    SizedBox(
                      height: sy(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account? ',
                          style: TextStyle(
                            color: UtanoColors.light,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(9),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.goTo(page: SignInPage()),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: UtanoColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: sy(9),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sy(40),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
