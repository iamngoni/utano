//
//  system_notification
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

class SystemNotification {
  const SystemNotification(
    this.title,
    this.message, {
    this.isError = false,
  });
  final String title;
  final String message;
  final bool isError;
}
