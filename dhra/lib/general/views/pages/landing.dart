import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/configs.dart';
import '../../../core/utils/user_role_to_page_mappings.dart';
import '../../../core/utils/user_role_to_screens_mappings.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/navigation/navigation_bloc.dart';
import '../widgets/login_form.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
                if (state is Authenticated) {
                  logger.i('Authenticated signal ...');
                  context.goToRefresh(
                    page: BlocProvider<NavigationBloc>(
                      create: (_) => NavigationBloc(
                        screens: userRoleToScreensMappings[
                            state.authResponse.user.role]!,
                      ),
                      child:
                          userRoleToPageMappings[state.authResponse.user.role],
                    ),
                  );
                }
              },
              builder: (context, state) {
                late Widget authWidget;

                if (state is AuthError) {
                  authWidget = Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lottie/error-2.json',
                          height: sy(100),
                          width: sy(100),
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: sy(10),
                        ),
                        Text(
                          state.error.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: sy(20),
                          ),
                        ),
                        SizedBox(
                          height: sy(5),
                        ),
                        Text(
                          state.error.message,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(15),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: sy(20),
                        ),
                        SizedBox(
                          width: sx(200),
                          child: PushButton(
                            buttonSize: ButtonSize.large,
                            onPressed: () => context.read<AuthBloc>().add(
                                  AuthLogin(
                                    email: usernameController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: sy(10),
                            ),
                            pressedOpacity: 0.7,
                            child: Text(
                              'RETRY',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: sy(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sy(10),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(AuthLogout());
                          },
                          child: Text(
                            'go back to login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(12),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is AuthLoading) {
                  authWidget = const Center(child: LoaderWidget());
                } else {
                  authWidget = LoginForm(
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
