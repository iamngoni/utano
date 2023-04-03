//
//  notifications
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:async';

class NotificationsService {
  late Function _showErrorNotificationListener;
  late Function _showSuccessNotificationListener;
  late Function _showNotification;

  Future<void> registerErrorNotificationListener({
    required Function listener,
  }) async {
    _showErrorNotificationListener = listener;
  }

  Future<void> registerSuccessNotificationListener({
    required Function listener,
  }) async {
    _showSuccessNotificationListener = listener;
  }

  Future<void> registerNotificationListener({
    required Function listener,
  }) async {
    _showNotification = listener;
  }

  Future<void> showErrorNotification({
    required String title,
    required String message,
  }) async {
    _showErrorNotificationListener(
      title: title,
      message: message,
    );
  }

  Future<dynamic> showSuccesssNotification({
    required String title,
    required String message,
  }) async {
    _showSuccessNotificationListener(
      title: title,
      message: message,
    );
  }

  Future<void> showNotification({required String message}) async {
    _showNotification(message: message);
  }
}
