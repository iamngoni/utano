//
//  change_password
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/change_password/change_password_bloc.dart';
import '../../configs/configs.dart';
import '../../services/di.dart';
import '../../services/notifications.dart';
import '../widgets/exception_widget.dart';
import '../widgets/loader_widget.dart';
import '../widgets/page_header.dart';
import '../widgets/utano_button.dart';
import '../widgets/utano_text_field.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(
                title: 'Change Password',
              ),
              SizedBox(
                height: sy(20),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sx(10),
                  vertical: sy(20),
                ),
                decoration: BoxDecoration(
                  color: UtanoColors.white,
                  border:
                      Border.all(color: UtanoColors.border.withOpacity(0.4)),
                  boxShadow: [
                    BoxShadow(
                      color: UtanoColors.grey.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0.5, 0.5),
                    ),
                    BoxShadow(
                      color: UtanoColors.grey.withOpacity(0.07),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(-0.5, -0.5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(11),
                ),
                child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                  listener: (context, state) {
                    if (state is ChangePasswordInitial) {
                      if (!state.reset) {
                        di<NotificationsService>().showSuccesssNotification(
                          title: 'Success',
                          message: 'Password has been updated',
                        );

                        _oldPasswordController.clear();
                        _passwordController.clear();
                        _passwordConfirmationController.clear();
                      }
                    }
                  },
                  builder: (context, state) {
                    late Widget passwordForm;

                    if (state is ChangePasswordLoading) {
                      passwordForm = Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: sy(20),
                          ),
                          child: const LoaderWidget(
                            color: UtanoColors.black,
                          ),
                        ),
                      );
                    } else if (state is ChangePasswordError) {
                      passwordForm = ExceptionWidget(
                        error: state.error,
                        onRetry: () => context.read<ChangePasswordBloc>().add(
                              ChangePassword(
                                oldPassword: _oldPasswordController.text,
                                password: _passwordController.text,
                                passwordConfirmation:
                                    _passwordConfirmationController.text,
                              ),
                            ),
                        onGoBack: () =>
                            context.read<ChangePasswordBloc>().add(Reset()),
                      );
                    } else {
                      passwordForm = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'It is recommended that you regularly update your '
                            'password',
                            style: TextStyle(
                              color: UtanoColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: sy(12),
                            ),
                          ),
                          SizedBox(
                            height: sy(10),
                          ),
                          UtanoTextField(
                            controller: _oldPasswordController,
                            label: 'Current Password',
                            placeholder: '********',
                          ),
                          SizedBox(
                            height: sy(10),
                          ),
                          UtanoTextField(
                            controller: _passwordController,
                            label: 'New Password',
                            placeholder: '********',
                          ),
                          SizedBox(
                            height: sy(10),
                          ),
                          UtanoTextField(
                            controller: _passwordConfirmationController,
                            label: 'Confirm Your New Password',
                            placeholder: '********',
                          ),
                          SizedBox(
                            height: sy(10),
                          ),
                          UtanoButton(
                            onTap: () {
                              if (_oldPasswordController.text.isEmpty) {
                                di<NotificationsService>()
                                    .showErrorNotification(
                                  title: 'Error',
                                  message: 'Current password is required!',
                                );
                                return;
                              }

                              if (_passwordController.text.isEmpty) {
                                di<NotificationsService>()
                                    .showErrorNotification(
                                  title: 'Error',
                                  message: 'New password is required!',
                                );
                                return;
                              }

                              if (_passwordConfirmationController
                                  .text.isEmpty) {
                                di<NotificationsService>()
                                    .showErrorNotification(
                                  title: 'Error',
                                  message: 'Confirm new password!',
                                );
                                return;
                              }

                              if (_passwordConfirmationController.text
                                      .compareTo(_passwordController.text) !=
                                  0) {
                                di<NotificationsService>()
                                    .showErrorNotification(
                                  title: 'Error',
                                  message: "Passwords don't match!",
                                );
                                return;
                              }

                              context.read<ChangePasswordBloc>().add(
                                    ChangePassword(
                                      oldPassword: _oldPasswordController.text,
                                      password: _passwordController.text,
                                      passwordConfirmation:
                                          _passwordConfirmationController.text,
                                    ),
                                  );
                            },
                            text: 'CHANGE PASSWORD',
                          ),
                        ],
                      );
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: passwordForm,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
