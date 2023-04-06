//
//  health_institutions_registration_form
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/blocs/file_picker/file_picker_bloc.dart';
import '../../../core/configs/configs.dart';
import '../../../core/views/widgets/file_picker_button.dart';
import '../../../core/views/widgets/utano_text_field.dart';

class HealthInstitutionsRegistrationForm extends StatelessWidget {
  HealthInstitutionsRegistrationForm({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sx(10),
            vertical: sy(20),
          ),
          decoration: BoxDecoration(
            color: UtanoColors.white,
            border: Border.all(color: UtanoColors.border.withOpacity(0.4)),
            boxShadow: [
              BoxShadow(
                color: UtanoColors.grey.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0.5, 0.5),
              ),
              BoxShadow(
                color: UtanoColors.grey.withOpacity(0.07),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(-0.5, -0.5),
              ),
            ],
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register Health Institution',
                style: TextStyle(
                  color: UtanoColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: sy(12),
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Row(
                children: [
                  Expanded(
                    child: UtanoTextField(
                      controller: _nameController,
                      label: 'Health Institution Name',
                      placeholder: 'Name',
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Expanded(
                    child: UtanoTextField(
                      controller: _emailController,
                      label: 'Email Address',
                      placeholder: 'utano@modestnerd.co',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sy(10),
              ),
              Row(
                children: [
                  Expanded(
                    child: UtanoTextField(
                      controller: _phoneNumberController,
                      label: 'Mobile Number',
                      placeholder: '+263777213388',
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(
                    width: sx(1),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Logo',
                          style: TextStyle(
                            color: UtanoColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(12),
                          ),
                        ),
                        SizedBox(
                          height: sy(7),
                        ),
                        FilePickerButton(
                          bloc: context.read<FilePickerBloc>(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sy(10),
              ),
              UtanoTextField(
                controller: _addressController,
                label: 'Address',
                placeholder: 'Enter address here ...',
                maxLines: 4,
              ),
              SizedBox(
                height: sy(10),
              ),
              UtanoButton(),
            ],
          ),
        );
      },
    );
  }
}
