//
//  system_admin_health_institutions_admins
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:localregex/localregex.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/blocs/dropdown_button/dropdown_button_bloc.dart';
import '../../../core/blocs/system_configs/system_configs_bloc.dart';
import '../../../core/configs/colors.dart';
import '../../../core/models/data/gender.dart';
import '../../../core/models/data/health_institution.dart';
import '../../../core/services/di.dart';
import '../../../core/services/notifications.dart';
import '../../../core/views/widgets/exception_widget.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/page_header.dart';
import '../../../core/views/widgets/utano_button.dart';
import '../../../core/views/widgets/utano_dropdown_button.dart';
import '../../../core/views/widgets/utano_text_field.dart';
import '../../blocs/admin_registration/admin_registration_bloc.dart';
import '../../blocs/health_institutions/health_institutions_bloc.dart';

class SystemAdminHealthInstitutionsAdminsPage extends StatefulWidget {
  const SystemAdminHealthInstitutionsAdminsPage({super.key});

  @override
  State<SystemAdminHealthInstitutionsAdminsPage> createState() =>
      _SystemAdminHealthInstitutionsAdminsPageState();
}

class _SystemAdminHealthInstitutionsAdminsPageState
    extends State<SystemAdminHealthInstitutionsAdminsPage> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailAddressController = TextEditingController();

  Gender? gender;
  HealthInstitution? healthInstitution;

  void _registerAdmin() {
    if (firstNameController.text.isEmpty) {
      di<NotificationsService>().showErrorNotification(
        title: 'Error',
        message: 'First name is required!',
      );
      return;
    }

    if (lastNameController.text.isEmpty) {
      di<NotificationsService>().showErrorNotification(
        title: 'Error',
        message: 'Last name is required!',
      );
      return;
    }

    if (emailAddressController.text.isEmpty) {
      di<NotificationsService>().showErrorNotification(
        title: 'Error',
        message: 'Email is required!',
      );
      return;
    } else {
      if (!LocalRegex.isEmail(
        emailAddressController.text,
      )) {
        di<NotificationsService>().showErrorNotification(
          title: 'Error',
          message: 'Email is invalid!',
        );
        return;
      }
    }

    if (healthInstitution.isNull) {
      di<NotificationsService>().showErrorNotification(
        title: 'Error',
        message: 'Select health institution!',
      );
      return;
    }

    if (gender.isNull) {
      di<NotificationsService>().showErrorNotification(
        title: 'Error',
        message: 'Select gender',
      );
      return;
    }

    context.read<AdminRegistrationBloc>().add(
          RegisterAdmin(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailAddressController.text,
            healthInstitution: healthInstitution!,
            gender: gender!,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: 'Register Admin',
              ),
              SizedBox(
                height: sy(20),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sx(10),
                  vertical: sy(20),
                ),
                decoration: BoxDecoration(
                  color: UtanoColors.white,
                  border:
                      Border.all(color: UtanoColors.border.withOpacity(0.4)),
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
                child:
                    BlocConsumer<AdminRegistrationBloc, AdminRegistrationState>(
                  listener: (context, state) {
                    if (state is AdminRegistrationInitial) {
                      if (!state.reset) {
                        firstNameController.clear();
                        lastNameController.clear();
                        emailAddressController.clear();
                        gender = null;
                        healthInstitution = null;

                        di<NotificationsService>().showSuccesssNotification(
                          title: 'Success',
                          message: 'Admin has been registered',
                        );
                      }
                    }
                  },
                  builder: (context, state) {
                    late Widget formWidget;

                    if (state is AdminRegistrationLoading) {
                      formWidget = const Center(
                        child: LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      );
                    } else if (state is AdminRegistrationError) {
                      formWidget = ExceptionWidget(
                        error: state.error,
                        onRetry: _registerAdmin,
                        onGoBack: () => context
                            .read<AdminRegistrationBloc>()
                            .add(const ResetRegistrationForm()),
                      );
                    } else {
                      formWidget = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register New Admin',
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
                                  controller: firstNameController,
                                  label: 'First Name',
                                  placeholder: 'Ngonidzashe',
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              Expanded(
                                child: UtanoTextField(
                                  controller: lastNameController,
                                  label: 'Last Name',
                                  placeholder: 'Mangudya',
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: sy(10),
                          ),
                          UtanoTextField(
                            controller: emailAddressController,
                            label: 'Email Address',
                            placeholder: 'employee@modestnerd.co',
                            keyboardType: TextInputType.emailAddress,
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
                                    BlocBuilder<SystemConfigsBloc,
                                        SystemConfigsState>(
                                      builder: (context, state) {
                                        late Widget dropdownWidget;

                                        if (state is SystemConfigsLoading) {
                                          dropdownWidget = const Center(
                                            child: LoaderWidget(
                                              color: UtanoColors.black,
                                              radius: 7,
                                            ),
                                          );
                                        } else if (state
                                            is SystemConfigsError) {
                                          dropdownWidget = const Center(
                                            child: Text(
                                              'Failed to load configs. Retry',
                                            ),
                                          );
                                        } else if (state
                                            is SystemConfigsLoaded) {
                                          dropdownWidget = BlocProvider<
                                              DropdownButtonBloc<Gender>>(
                                            create: (context) =>
                                                DropdownButtonBloc<Gender>(),
                                            child: Builder(
                                              builder: (context) {
                                                return SizedBox(
                                                  height: sy(30),
                                                  width: context.width,
                                                  child: UtanoDropdownButton<
                                                      Gender>(
                                                    title: 'Gender',
                                                    items: state.genders,
                                                    onChanged:
                                                        (Gender? gender) {
                                                      setState(() {
                                                        this.gender = gender;
                                                      });
                                                    },
                                                    value: gender,
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
                              ),
                              SizedBox(
                                width: sx(5),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Health Institution',
                                      style: TextStyle(
                                        color: UtanoColors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: sy(12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: sy(7),
                                    ),
                                    BlocBuilder<HealthInstitutionsBloc,
                                        HealthInstitutionsState>(
                                      builder: (context, state) {
                                        late Widget dropdownWidget;

                                        if (state
                                            is HealthInstitutionsLoading) {
                                          dropdownWidget = const Center(
                                            child: LoaderWidget(
                                              color: UtanoColors.black,
                                            ),
                                          );
                                        } else if (state
                                            is HealthInstitutionsError) {
                                          dropdownWidget = Center(
                                            child: GestureDetector(
                                              onTap: () => context
                                                  .read<
                                                      HealthInstitutionsBloc>()
                                                  .add(
                                                    ListHealthInstitutions(),
                                                  ),
                                              child: const Text(
                                                'Failed to load institutions.'
                                                ' Retry',
                                              ),
                                            ),
                                          );
                                        } else if (state
                                            is HealthInstitutionsLoaded) {
                                          dropdownWidget = BlocProvider<
                                              DropdownButtonBloc<
                                                  HealthInstitution>>(
                                            create: (context) =>
                                                DropdownButtonBloc<
                                                    HealthInstitution>(),
                                            child: Builder(
                                              builder: (context) {
                                                return SizedBox(
                                                  height: sy(30),
                                                  width: context.width,
                                                  child: UtanoDropdownButton<
                                                      HealthInstitution>(
                                                    title: 'Health Institution',
                                                    items: state
                                                        .healthInstitutions,
                                                    onChanged: (
                                                      HealthInstitution?
                                                          healthInstitution,
                                                    ) {
                                                      setState(() {
                                                        this.healthInstitution =
                                                            healthInstitution;
                                                      });
                                                    },
                                                    value: healthInstitution,
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: sy(10),
                          ),
                          UtanoButton(
                            onTap: _registerAdmin,
                          ),
                        ],
                      );
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: formWidget,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
