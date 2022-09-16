/*
 * Filename: /home/iamngoni/projects/ModestNerd/business/beecrumbs/lib/core/models/log_level.dart
 * Path: /home/iamngoni/projects/ModestNerd/business/beecrumbs/lib/core/models
 * Created Date: Saturday, August 20th 2022, 1:04:42 am
 * Author: Ngonidzashe Mangudya
 * 
 * Copyright (c) 2022 MIT
 */

enum LogLevel {
  debug('DEBUG'),
  info('INFO'),
  warning('WARNING'),
  error('ERROR');

  const LogLevel(this.level);
  final String level;
}
