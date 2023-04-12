//
//  notifications_manager
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/configs.dart';
import '../models/data/system_notification.dart';
import '../services/di.dart';
import '../services/notifications.dart';

class NotificationsManager extends StatefulWidget {
  const NotificationsManager({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<NotificationsManager> createState() => _NotificationsManagerState();
}

class _NotificationsManagerState extends State<NotificationsManager> {
  final NotificationsService notificationsService = di<NotificationsService>();
  List<SystemNotification> notifications = [];

  void addNotification(String title, String message, {bool isError = false}) {
    final SystemNotification notification = SystemNotification(
      title,
      message,
      isError: isError,
    );
    // TODO: play a sound
    setState(() {
      notifications.insert(0, notification);
    });

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        notifications.remove(notification);
      });
    });
  }

  void removeNotification(SystemNotification notification) {
    setState(() {
      notifications.remove(notification);
    });
  }

  @override
  void initState() {
    super.initState();
    logger.i('Notifications Manager setting up ...');
    notificationsService
      ..registerErrorNotificationListener(listener: _showErrorDialog)
      ..registerSuccessNotificationListener(listener: _showSuccessDialog)
      ..registerNotificationListener(listener: _showNotification);
    logger.i('Notifications Manager setup complete ...');
  }

  void _showNotification({required String message}) {
    logger.d(message);
    addNotification('Notification', message);
  }

  void _showErrorDialog({
    required String title,
    required String message,
  }) {
    logger.e('$title, $message');
    addNotification(title, message, isError: true);
  }

  void _showSuccessDialog({
    required String title,
    required String message,
  }) {
    logger.i('$title, $message');
    addNotification(title, message);
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Stack(
          children: [
            widget.child,
            Positioned(
              right: sx(5),
              child: SizedBox(
                width: sx(130),
                height: context.height,
                child: Column(
                  children: notifications
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.symmetric(
                            vertical: sy(5),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: sx(7),
                            vertical: sy(15),
                          ),
                          decoration: BoxDecoration(
                            color: e.isError ? Colors.red : Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: sy(12),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      removeNotification(e);
                                    },
                                    child: const Icon(
                                      CupertinoIcons.xmark_circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                e.message,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: sy(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
