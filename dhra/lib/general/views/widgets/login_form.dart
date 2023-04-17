//
//  login_form
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/services/di.dart';
import '../../../core/services/notifications.dart';
import '../../blocs/auth/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.usernameController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;

  void _toggleObscureText() => setState(() => _obscureText = !_obscureText);

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
                  controller: widget.usernameController,
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
                  controller: widget.passwordController,
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
                  obscureText: _obscureText,
                  suffix: Padding(
                    padding: EdgeInsets.only(
                      right: sx(5),
                    ),
                    child: GestureDetector(
                      onTap: _toggleObscureText,
                      child: AnimatedCrossFade(
                        firstChild: const Icon(
                          CupertinoIcons.eye,
                          color: UtanoColors.white,
                        ),
                        secondChild: const Icon(
                          CupertinoIcons.eye_slash_fill,
                          color: UtanoColors.white,
                        ),
                        crossFadeState: _obscureText
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 200),
                      ),
                    ),
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
                    if (widget.usernameController.text.isEmpty) {
                      di<NotificationsService>().showErrorNotification(
                        title: 'Missing field',
                        message: 'Username is required',
                      );
                      return;
                    }

                    if (widget.passwordController.text.isEmpty) {
                      di<NotificationsService>().showErrorNotification(
                        title: 'Missing field',
                        message: 'Password is required',
                      );
                      return;
                    }

                    context.read<AuthBloc>().add(
                          AuthLogin(
                            email: widget.usernameController.text,
                            password: widget.passwordController.text,
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
