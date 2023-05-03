import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

import '../../../core/configs/logger.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(ConnectivityIdle()) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        logger.error(
          'Not connected to either wifi or mobile data. Disconnecting',
        );
        if (kDebugMode) {
          add(Connect());
        } else {
          add(Disconnect());
        }
      } else {
        logger.info('Connected to $result.');
        add(Connect());
      }
    });

    on<Connect>((event, emit) {
      emit(ConnectivityConnected());
    });
    on<Disconnect>((event, emit) {
      emit(ConnectivityDisconnected());
    });
    on<CheckConnection>((event, emit) async {
      emit(ConnectivityIdle());
      logger.info('Checking connection...');
      try {
        // use lookup to get the ConnectivityService
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          logger.info('Device Connected');
          emit(ConnectivityConnected());
        } else {
          logger.info('Device Disconnected');
          emit(ConnectivityDisconnected());
        }
      } catch (e, stackTrace) {
        logger.error(
          'Error occurred. Device failed to lookup google.com. Checking '
          'for connectivity again!',
          error: e,
          stackTrace: stackTrace,
          source: 'connectivity_bloc',
        );

        final ConnectivityResult result =
            await Connectivity().checkConnectivity();
        logger.info('$result');
        if (result != ConnectivityResult.none) {
          emit(ConnectivityConnected());
        } else {
          emit(ConnectivityDisconnected());
        }
      }
    });
  }
}
