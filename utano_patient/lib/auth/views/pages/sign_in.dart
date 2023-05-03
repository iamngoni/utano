//
//  sign_in
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 4/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:localregex/localregex.dart';
import '../../../core/configs/colors.dart';
import '../../../core/widgets/loader_widget.dart';
import '../../../utano/views/pages/utano_app.dart';
import '../../blocs/auth/auth_bloc.dart';
import 'sign_up.dart';

import '../../../core/widgets/utano_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
          backgroundColor: UtanoColors.secondary,
        ),
        body: Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
          ),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                context.notify(message: state.exception.message, isError: true);
              }
              if (state is AuthSuccess) {
                context.goToRefresh(page: UtanoApplication());
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return LoaderWidget();
              }

              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: sy(40)),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: UtanoColors.dark,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(10),
                        ),
                      ),
                      SizedBox(
                        height: sy(10),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: sx(20),
                          vertical: sy(3),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: UtanoColors.dark,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'h180202@hit.ac.zw',
                            hintStyle: TextStyle(
                              color: UtanoColors.dark.withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                              fontSize: sy(9),
                            ),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }

                            if (!LocalRegex.isEmail(value)) {
                              return 'Email is invalid!';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: sy(20),
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                          color: UtanoColors.dark,
                          fontWeight: FontWeight.w500,
                          fontSize: sy(10),
                        ),
                      ),
                      SizedBox(
                        height: sy(10),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: sx(20),
                          vertical: sy(3),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: UtanoColors.dark,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: '********',
                            hintStyle: TextStyle(
                              color: UtanoColors.dark.withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                              fontSize: sy(9),
                            ),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: sy(20),
                      ),
                      UtanoButton(
                        text: 'Sign In',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          }
                        },
                        color: UtanoColors.primary,
                        textColor: UtanoColors.light,
                      ),
                      SizedBox(height: sy(20)),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up Instead?',
                          style: TextStyle(
                            color: UtanoColors.dark,
                            fontWeight: FontWeight.w500,
                            fontSize: sy(9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
