//
//  sign_in
//  utano_patient
//
//  Created by Ngonidzashe Mangudya on 4/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:localregex/localregex.dart';
import 'sign_up.dart';

import '../../../core/widgets/utano_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: sy(20)),
                  Container(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }

                        if (!LocalRegex.isEmail(value)) {
                          return 'Email is invalid!';
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: sy(20),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: sy(20)),
                  UtanoButton(
                    text: 'Sign In',
                    onTap: () {},
                  ),
                  SizedBox(height: sy(20)),
                  TextButton(
                    onPressed: () {
                      context.goToRefresh(page: SignUpPage());
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
