//
//  personal_information_form
//  dhra
//
//  Created by Ngonidzashe Mangudya on 12/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/dropdown_button/dropdown_button_bloc.dart';
import '../../blocs/system_configs/system_configs_bloc.dart';
import '../../configs/colors.dart';
import '../../models/data/gender.dart';
import 'loader_widget.dart';
import 'utano_dropdown_button.dart';
import 'utano_text_field.dart';

class PersonalInformationForm extends StatefulWidget {
  const PersonalInformationForm({
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController mobileNumberController,
    required TextEditingController addressController,
    required TextEditingController nationalIdNumberController,
    super.key,
  })  : _firstNameController = firstNameController,
        _lastNameController = lastNameController,
        _mobileNumberController = mobileNumberController,
        _addressController = addressController,
        _nationalIdNumberController = nationalIdNumberController;

  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final TextEditingController _mobileNumberController;
  final TextEditingController _addressController;
  final TextEditingController _nationalIdNumberController;

  @override
  State<PersonalInformationForm> createState() =>
      _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  final ScrollController _scrollController = ScrollController();
  Gender? _gender;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Expanded(
          child: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(10),
              vertical: sy(20),
            ),
            decoration: BoxDecoration(
              color: UtanoColors.white,
              border: Border.all(
                color: UtanoColors.border.withOpacity(0.4),
              ),
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
            child: ListView(
              controller: _scrollController,
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(
                    color: UtanoColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: sy(12),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._firstNameController,
                  label: 'Patient First Name',
                  placeholder: 'Ngonidzashe',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._lastNameController,
                  label: 'Patient Last Name',
                  placeholder: 'Mangudya',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._nationalIdNumberController,
                  label: 'National ID',
                  placeholder: 'National ID',
                ),
                SizedBox(
                  height: sy(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        color: UtanoColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(12),
                      ),
                    ),
                    SizedBox(
                      height: sy(7),
                    ),
                    BlocBuilder<SystemConfigsBloc, SystemConfigsState>(
                      builder: (context, state) {
                        late Widget dropdownWidget;

                        if (state is SystemConfigsLoading) {
                          dropdownWidget = const Center(
                            child: LoaderWidget(
                              color: UtanoColors.black,
                              radius: 7,
                            ),
                          );
                        } else if (state is SystemConfigsError) {
                          dropdownWidget = const Center(
                            child: Text(
                              'Failed to load configs. Retry',
                            ),
                          );
                        } else if (state is SystemConfigsLoaded) {
                          dropdownWidget =
                              BlocProvider<DropdownButtonBloc<Gender>>(
                            create: (context) => DropdownButtonBloc<Gender>(),
                            child: Builder(
                              builder: (context) {
                                return SizedBox(
                                  height: sy(30),
                                  width: context.width,
                                  child: UtanoDropdownButton<Gender>(
                                    title: 'Gender',
                                    items: state.genders,
                                    onChanged: (Gender? gender) {
                                      setState(() {
                                        _gender = gender;
                                      });
                                    },
                                    value: _gender,
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          dropdownWidget = const Center(
                            child: Text('Load configs'),
                          );
                        }

                        return AnimatedSwitcher(
                          duration: const Duration(
                            milliseconds: 200,
                          ),
                          child: dropdownWidget,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._mobileNumberController,
                  label: 'Patient Mobile Number',
                  placeholder: '+263777213388',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: sy(10),
                ),
                UtanoTextField(
                  controller: widget._addressController,
                  label: 'Patient Address',
                  placeholder: 'Add patient address here ...',
                  maxLines: 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
