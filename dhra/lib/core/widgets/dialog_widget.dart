/*
    @Project: hekima_patient
    @Date: 10, September, 2022
    @Author: Ngonidzashe Mangudya

    Copyright (c) 2022 ModestNerd
*/

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../functions/dismiss_keyboard.dart';
import '../services/di.dart';
import '../services/dialog.dart';
import 'error_dialog_widget.dart';
import 'success_dialog_widget.dart';

class DialogManager extends StatefulWidget {
  const DialogManager({super.key, required this.child});

  final Widget child;

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final DialogService _dialogService = di<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService
      ..registerLoaderDialogListener = _showDialog
      ..registerErrorDialogListener = _showErrorDialog
      ..registerSuccessDialogListener = _showSuccessDialog
      ..registerNotificationListener = _showNotification
      ..registerDialogRemover = _dismissDialog
      ..registerContext = context;
  }

  Future<void> _showDialog({String? message = "Working on it ⏳"}) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Material(
        color: Colors.transparent,
        child: RelativeBuilder(
          builder: (context, height, width, sy, sx) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: sy(20),
                  width: sy(20),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  message ?? "Working on it ⏳",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: sy(10),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showNotification({required String message, bool isError = false}) {
    context.notify(message: message, isError: isError);
  }

  void _dismissDialog() {
    context.goBack();
  }

  Future<void> _showErrorDialog({
    required String title,
    required String message,
    String? buttonText,
    Function? onButtonClick,
    bool? isLogout = false,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Dialog(
            elevation: 5,
            child: ErrorDialogWidget(
              title: title,
              message: message,
              buttonText: buttonText,
              onButtonClick: onButtonClick,
              isLogout: isLogout,
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialog({
    required String title,
    required String message,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Dialog(
            elevation: 5,
            child: SuccessDialogWidget(
              title: title,
              message: message,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        dismissKeyboard(context);
      },
      child: widget.child,
    );
  }
}
