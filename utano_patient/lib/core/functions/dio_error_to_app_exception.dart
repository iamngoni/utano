import 'package:dio/dio.dart';

import '../models/data/app_exception.dart';
import '../models/data/network_response.dart';
import 'encryption.dart';

AppException dioErrorToAppException(DioError error) {
  late AppException exception;
  switch (error.type) {
    case DioErrorType.connectTimeout:
      exception = AppException(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection 📡 and retry.',
        title: 'Connection Timeout',
      );
      break;
    case DioErrorType.sendTimeout:
      exception = AppException(
        'Sorry Utano is unable to communicate with the remote resources at '
        'the moment, please check your internet connection 📡 and retry.',
        title: 'Connection Error',
      );
      break;
    case DioErrorType.receiveTimeout:
      exception = AppException(
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
          exception = AppException(
            'Sorry Utano is unable to communicate with the remote resources at moment',
          );
        } else {
          final NetworkResponse networkResponse =
              NetworkResponse.fromJson(decrypted);
          exception = AppException(
            '${networkResponse.message}',
          );
        }
      } else {
        exception = AppException(
          'Sorry Utano is unable to communicate with the remote resources at '
          'the moment, please check your internet connection 📡 and retry.',
          title: 'Connection Error',
        );
      }

      break;
    case DioErrorType.other:
      exception = AppException(
        'Sorry Utano is unable to communicate with the remote resources at '
        'the moment, please check your internet connection 📡 and retry.',
        title: 'Network Error',
      );
      break;
    case DioErrorType.cancel:
      exception = AppException(
        'Sorry Utano is unable to communicate with the remote resources at '
        'the moment, please check your internet connection 📡 and retry.',
        title: 'Cancelled Request',
      );
      break;
  }

  return exception;
}
