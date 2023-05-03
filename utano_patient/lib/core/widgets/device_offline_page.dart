import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';
import 'button_widget.dart';

class DeviceOfflinePage extends StatelessWidget {
  const DeviceOfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off_rounded,
                    color: Colors.white,
                    size: sy(50),
                  ),
                  SizedBox(
                    height: sy(30),
                  ),
                  Text(
                    'OH SNAP!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: sy(12),
                    ),
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Text(
                    'Your device is currently offline and not connected to the '
                    'internet or there might be an issue with your network '
                    'connection. Please check your connection and try again.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(9.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: sy(50),
                  ),
                  ButtonWidget(
                    text: 'Try Again',
                    onTap: () => BlocProvider.of<ConnectivityBloc>(context)
                        .add(CheckConnection()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
