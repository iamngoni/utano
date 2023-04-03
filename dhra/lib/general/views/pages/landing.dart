import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return MacosWindow(
          child: Container(
            height: context.height,
            width: context.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg-2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: context.height,
                  width: context.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage('assets/images/logo.png'),
                        color: Colors.white,
                        height: sy(70),
                      ),
                      SizedBox(
                        height: sy(20),
                      ),
                      SizedBox(
                        width: sx(200),
                        child: MacosTextField(
                          placeholder: 'Username',
                          placeholderStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontWeight: FontWeight.w400,
                            fontSize: sy(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: sy(10),
                            horizontal: sx(10),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sy(20),
                      ),
                      SizedBox(
                        width: sx(200),
                        child: MacosTextField(
                          placeholder: 'Password',
                          placeholderStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontWeight: FontWeight.w400,
                            fontSize: sy(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: sy(10),
                            horizontal: sx(10),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sy(20),
                      ),
                      SizedBox(
                        width: sx(200),
                        child: PushButton(
                          buttonSize: ButtonSize.large,
                          onPressed: () {},
                          borderRadius: BorderRadius.circular(10),
                          padding: EdgeInsets.symmetric(
                            vertical: sy(10),
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: sy(10),
                  right: sx(5),
                  child: const Icon(
                    CupertinoIcons.settings,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
