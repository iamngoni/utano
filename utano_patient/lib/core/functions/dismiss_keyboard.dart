import 'package:flutter/material.dart';

import '../configs/logger.dart';

void dismissKeyboard(BuildContext context) {
  logger.info('Dismissing keyboard', source: 'dismiss_keyboard');
  if (MediaQuery.of(context).viewInsets.bottom > 0) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
