import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../widgets/login_form.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEmail = false;

  void switchBetweenUsernameAndEmail() => setState(() {
        isEmail = !isEmail;
      });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return MacosWindow(
          child: Container(
            height: context.height,
            width: context.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg-2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                late Widget authWidget;

                if (state is AuthError) {
                  authWidget = Column(
                    children: [],
                  );
                } else if (state is AuthLoading) {
                  authWidget = Center(
                    child: CupertinoActivityIndicator(
                      radius: sy(15),
                    ),
                  );
                } else {
                  authWidget = LoginForm(
                    formKey: formKey,
                    usernameController: usernameController,
                    passwordController: passwordController,
                  );
                }

                return Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: authWidget,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
