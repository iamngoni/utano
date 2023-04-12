//
//  dio_error_to_error
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dio/dio.dart';

import '../models/data/application_error.dart';
import '../models/data/network_response.dart';
import 'encryption.dart';

ApplicationError dioErrorToApplicationError(DioError error) {
  late ApplicationError exception;
  switch (error.type) {
    case DioErrorType.connectTimeout:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection 📡 and retry.',
        title: 'Connection Timeout',
      );
      break;
    case DioErrorType.sendTimeout:
      exception = ApplicationError(
        'Sorry Utano is unable to communicate with the remote resources at '
        'the moment, please check your internet connection 📡 and retry.',
        title: 'Connection Error',
      );
      break;
    case DioErrorType.receiveTimeout:
      exception = ApplicationError(
        'Sorry Utano is unable to communicate with the remote resources at '
        'the moment, please check your internet connection 📡 and retry.',
        title: 'Connection Error',
      );
      break;
    case DioErrorType.response:
      if (error.response != null) {
        final Map<String, dynamic>? decrypted =
            decrypt(error.response!.data['payload'] as String);
        if (decrypted == null) {
          exception = ApplicationError(
            'Sorry Utano is unable to communicate with the remote resources at moment',
          );
        } else {
          final NetworkResponse networkResponse =
              NetworkResponse.fromJson(decrypted);
          exception = ApplicationError(
            '${networkResponse.message}',
          );
        }
      } else {
        exception = ApplicationError(
          'Sorry Utano is unable to communicate with the remote resources at '
          'the moment, please check your internet connection 📡 and retry.',
          title: 'Connection Error',
        );
      }

      break;
    case DioErrorType.other:
      exception = ApplicationError(
        'Sorry Utano is unable to communicate with the remote resources at '
        'the moment, please check your internet connection 📡 and retry.',
        title: 'Network Error',
      );
      break;
    case DioErrorType.cancel:
      exception = ApplicationError(
        'Sorry Utano is unable to communicate with the remote resources at '
        'the moment, please check your internet connection 📡 and retry.',
        title: 'Cancelled Request',
      );
      break;
  }

  return exception;
}
