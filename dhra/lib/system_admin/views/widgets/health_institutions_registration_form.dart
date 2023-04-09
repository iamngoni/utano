//
//  health_institutions_registration_form
//  dhra
//
//  Created by Ngonidzashe Mangudya on 5/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:localregex/localregex.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/blocs/dropdown_button/dropdown_button_bloc.dart';
import '../../../core/blocs/file_picker/file_picker_bloc.dart';
import '../../../core/blocs/system_configs/system_configs_bloc.dart';
import '../../../core/configs/configs.dart';
import '../../../core/models/data/district.dart';
import '../../../core/services/di.dart';
import '../../../core/services/notifications.dart';
import '../../../core/views/widgets/exception_widget.dart';
import '../../../core/views/widgets/file_picker_button.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/utano_button.dart';
import '../../../core/views/widgets/utano_dropdown_button.dart';
import '../../../core/views/widgets/utano_text_field.dart';
import '../../blocs/health_institutions/health_institutions_bloc.dart';

class HealthInstitutionsRegistrationForm extends StatefulWidget {
  const HealthInstitutionsRegistrationForm({super.key});

  @override
  State<HealthInstitutionsRegistrationForm> createState() =>
      _HealthInstitutionsRegistrationFormState();
}

class _HealthInstitutionsRegistrationFormState
    extends State<HealthInstitutionsRegistrationForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  District? district;

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
          child: BlocConsumer<HealthInstitutionsBloc, HealthInstitutionsState>(
            listener: (context, state) {
              if (state is HealthInstitutionsLoaded) {
                _nameController.clear();
                _emailController.clear();
                _phoneNumberController.clear();
                _addressController.clear();
                district = null;
              }
            },
            builder: (context, state) {
              late Widget formChild;

              if (state is HealthInstitutionsLoading) {
                formChild = const Center(
                  child: LoaderWidget(
                    color: UtanoColors.black,
                  ),
                );
              } else if (state is HealthInstitutionsError) {
                formChild = ExceptionWidget(
                  error: state.error,
                  onRetry: () => context.read<HealthInstitutionsBloc>().add(
                        ListHealthInstitutions(),
                      ),
                );
              } else {
                formChild = Column(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'District',
                                style: TextStyle(
                                  color: UtanoColors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: sy(12),
                                ),
                              ),
                              SizedBox(
                                height: sy(7),
                              ),
                              BlocBuilder<SystemConfigsBloc,
                                  SystemConfigsState>(
                                builder: (context, state) {
                                  late Widget dropdownWidget;

                                  if (state is SystemConfigsLoading) {
                                    dropdownWidget = const Center(
                                      child: LoaderWidget(
                                        color: UtanoColors.black,
                                      ),
                                    );
                                  } else if (state is SystemConfigsError) {
                                    dropdownWidget = Center(
                                      child: GestureDetector(
                                        onTap: () => context
                                            .read<SystemConfigsBloc>()
                                            .add(LoadSystemConfigs()),
                                        child: const Text(
                                          'Failed to load configs. Retry',
                                        ),
                                      ),
                                    );
                                  } else if (state is SystemConfigsLoaded) {
                                    dropdownWidget = BlocProvider<
                                        DropdownButtonBloc<District>>(
                                      create: (context) =>
                                          DropdownButtonBloc<District>(),
                                      child: Builder(
                                        builder: (context) {
                                          return SizedBox(
                                            height: sy(30),
                                            width: context.width,
                                            child:
                                                UtanoDropdownButton<District>(
                                              title: 'District',
                                              items: state.districts,
                                              onChanged: (District? district) {
                                                setState(() {
                                                  this.district = district;
                                                });
                                              },
                                              value: district,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    dropdownWidget = Center(
                                      child: GestureDetector(
                                        onTap: () => context
                                            .read<SystemConfigsBloc>()
                                            .add(LoadSystemConfigs()),
                                        child: const Text('Load configs'),
                                      ),
                                    );
                                  }

                                  return AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    child: dropdownWidget,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: UtanoTextField(
                            controller: _addressController,
                            label: 'Address',
                            placeholder: 'Enter address here ...',
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sy(10),
                    ),
                    UtanoButton(
                      onTap: () {
                        if (context.read<FilePickerBloc>().state
                            is FilePickerFileLoaded) {
                          if (_nameController.text.isEmpty) {
                            di<NotificationsService>().showErrorNotification(
                              title: 'Missing field',
                              message: 'Name is required',
                            );
                            return;
                          }

                          if (_addressController.text.isEmpty) {
                            di<NotificationsService>().showErrorNotification(
                              title: 'Missing field',
                              message: 'Address is required',
                            );
                            return;
                          }

                          if (_phoneNumberController.text.isNotEmpty) {
                            if (!LocalRegex.isZimMobile(
                              _phoneNumberController.text,
                            )) {
                              di<NotificationsService>().showErrorNotification(
                                title: 'Invalid Field',
                                message: 'Mobile Number is invalid',
                              );
                              return;
                            }
                          } else {
                            di<NotificationsService>().showErrorNotification(
                              title: 'Missing field',
                              message: 'Phone number is required',
                            );
                            return;
                          }

                          if (_emailController.text.isNotEmpty) {
                            if (!LocalRegex.isEmail(_emailController.text)) {
                              di<NotificationsService>().showErrorNotification(
                                title: 'Invalid Field',
                                message: 'Email address is invalid',
                              );
                              return;
                            }
                          } else {
                            di<NotificationsService>().showErrorNotification(
                              title: 'Missing field',
                              message: 'Email is required',
                            );
                            return;
                          }

                          if (district == null) {
                            di<NotificationsService>().showErrorNotification(
                              title: 'Missing field',
                              message: 'District is required',
                            );
                            return;
                          }

                          context.read<HealthInstitutionsBloc>().add(
                                RegisterHealthInstitution(
                                  name: _nameController.text,
                                  address: _addressController.text,
                                  phoneNumber:
                                      _phoneNumberController.text.formatNumber(
                                    formatType: FormatType.countryCodePlus,
                                  )!,
                                  email: _emailController.text,
                                  logo: (context.read<FilePickerBloc>().state
                                          as FilePickerFileLoaded)
                                      .file,
                                  district: district!.id,
                                ),
                              );
                        } else {
                          di<NotificationsService>().showErrorNotification(
                            title: 'Missing field',
                            message: 'Select a logo',
                          );
                          return;
                        }
                      },
                    ),
                  ],
                );
              }

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: formChild,
              );
            },
          ),
        );
      },
    );
  }
}
