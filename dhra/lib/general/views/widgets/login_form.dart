//
//  login_form
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

import '../../../core/services/di.dart';
import '../../../core/services/notifications.dart';
import '../../blocs/auth/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    required this.usernameController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/logo-red.png'),
                height: sy(70),
              ),
              SizedBox(
                height: sy(20),
              ),
              SizedBox(
                width: sx(200),
                child: MacosTextField(
                  placeholder: 'Username',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(12),
                  ),
                  controller: usernameController,
                  placeholderStyle: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontWeight: FontWeight.w400,
                    fontSize: sy(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: sy(10),
                    horizontal: sx(10),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: sy(20),
              ),
              SizedBox(
                width: sx(200),
                child: MacosTextField(
                  placeholder: 'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(12),
                  ),
                  controller: passwordController,
                  placeholderStyle: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontWeight: FontWeight.w400,
                    fontSize: sy(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: sy(10),
                    horizontal: sx(10),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: sy(20),
              ),
              SizedBox(
                width: sx(200),
                child: PushButton(
                  buttonSize: ButtonSize.large,
                  onPressed: () {
                    if (usernameController.text.isEmpty) {
                      di<NotificationsService>().showErrorNotification(
                        title: 'Missing field',
                        message: 'Username is required',
                      );
                      return;
                    }

                    if (passwordController.text.isEmpty) {
                      di<NotificationsService>().showErrorNotification(
                        title: 'Missing field',
                        message: 'Password is required',
                      );
                      return;
                    }

                    context.read<AuthBloc>().add(
                          AuthLogin(
                            email: usernameController.text,
                            password: passwordController.text,
                          ),
                        );
                  },
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: sy(10),
                  ),
                  pressedOpacity: 0.7,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: sy(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
