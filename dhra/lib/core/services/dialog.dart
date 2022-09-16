/*
    @Project: hekima_patient
    @Date: 10, September, 2022
    @Author: Ngonidzashe Mangudya

    Copyright (c) 2022 ModestNerd
*/

import 'dart:async';

import 'package:flutter/material.dart';

class DialogService {
  late Function _showLoaderDialogListener;
  late Function _showErrorDialogListener;
  late Function _showSuccessDialogListener;
  late Completer? _dialogCompleter;
  late Function _removeDialog;
  late Function _showNotification;
  late BuildContext _context;

  set registerLoaderDialogListener(Function listener) {
    _showLoaderDialogListener = listener;
  }

  set registerContext(BuildContext context) {
    _context = context;
  }

  set registerErrorDialogListener(Function listener) {
    _showErrorDialogListener = listener;
  }

  set registerSuccessDialogListener(Function listener) {
    _showSuccessDialogListener = listener;
  }

  set registerNotificationListener(Function listener) {
    _showNotification = listener;
  }

  set registerDialogRemover(Function listener) {
    _removeDialog = listener;
  }

  /// Methods to invoke the dialogs
  Future showLoaderDialog({String? message}) {
    _dialogCompleter = Completer();
    _showLoaderDialogListener(message: message);
    return _dialogCompleter!.future;
  }

  Future<void> showErrorDialog({
    required String title,
    required String message,
    String? buttonText,
    Function? onButtonClick,
    bool? isLogout = false,
  }) {
    _dialogCompleter = Completer();
    _showErrorDialogListener(
      title: title,
      message: message,
      buttonText: buttonText,
      onButtonClick: onButtonClick,
      isLogout: isLogout,
    );
    return _dialogCompleter!.future;
  }

  Future showSuccessDialog({required String title, required String message}) {
    _dialogCompleter = Completer();
    _showSuccessDialogListener(
      title: title,
      message: message,
    );
    return _dialogCompleter!.future;
  }

  void showNotification({required String message, bool isError = false}) {
    _showNotification(message: message, isError: isError);
  }

  BuildContext? useContext() {
    return _context;
  }

  void dismissDialog() {
    _dialogCompleter!.complete();
    _removeDialog();
    _dialogCompleter = null;
  }
}
