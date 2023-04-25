//
//  point_of_service
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/point_of_service/point_of_service_bloc.dart';
import '../../configs/colors.dart';
import '../../models/data/gender.dart';
import '../../services/di.dart';
import '../../services/notifications.dart';
import '../widgets/check_in_prescription_stage.dart';
import '../widgets/check_in_stage_1.dart';
import '../widgets/check_in_stage_2.dart';
import '../widgets/exception_widget.dart';
import '../widgets/loader_widget.dart';
import '../widgets/page_header.dart';
import '../widgets/utano_button.dart';

class PointOfServicePage extends StatefulWidget {
  const PointOfServicePage({super.key});

  @override
  State<PointOfServicePage> createState() => _PointOfServicePageState();
}

class _PointOfServicePageState extends State<PointOfServicePage> {
  final PageController _pageController = PageController();

  // Personal Details
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _mobileNumberController = TextEditingController();

  final TextEditingController _nationalIdNumberController =
      TextEditingController();

  // Checkup Details
  final TextEditingController _temperatureController = TextEditingController();

  final TextEditingController _systolicBloodPressureController =
      TextEditingController();

  final TextEditingController _diastolicBloodPressureController =
      TextEditingController();

  final TextEditingController _pulseController = TextEditingController();

  final TextEditingController _respiratoryRateController =
      TextEditingController();

  // Checkup Notes
  final TextEditingController _patientNotesController = TextEditingController();

  final TextEditingController _examinationNotesController =
      TextEditingController();

  final TextEditingController _diagnosisNotesController =
      TextEditingController();

  final TextEditingController _treatmentNotesController =
      TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  Gender? _gender;
  bool _useAge = false;
  DateTime? _dateOfBirth;

  void _updateGender(Gender? gender) => setState(() {
        _gender = gender;
      });

  void _updateUseAge(bool useAge) => setState(() {
        _useAge = useAge;
      });

  void _updateDateOfBirth(DateTime? dateOfBirth) => setState(() {
        _dateOfBirth = dateOfBirth;
      });

  void _checkInPatient() {
    context.read<PointOfServiceBloc>().add(
          CheckInPatient(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            mobileNumber: _mobileNumberController.text,
            gender: 'MALE',
            address: _addressController.text,
            age: _useAge ? int.parse(_ageController.text) : null,
            dateOfBirth: _useAge ? null : _dateOfBirth,
            temperature: double.parse(_temperatureController.text),
            systolicBloodPressure:
                double.parse(_systolicBloodPressureController.text),
            diastolicBloodPressure:
                double.parse(_diastolicBloodPressureController.text),
            pulse: double.parse(_pulseController.text),
            respiratoryRate: double.parse(_respiratoryRateController.text),
            patientNotes: _patientNotesController.text,
            examinationNotes: _examinationNotesController.text,
            diagnosisNotes: _diagnosisNotesController.text,
            treatmentNotes: _treatmentNotesController.text,
          ),
        );
  }

  void _clearControllersAndFormFields() {
    _firstNameController.clear();
    _lastNameController.clear();
    _mobileNumberController.clear();
    _addressController.clear();
    _nationalIdNumberController.clear();
    _temperatureController.clear();
    _systolicBloodPressureController.clear();
    _diastolicBloodPressureController.clear();
    _pulseController.clear();
    _respiratoryRateController.clear();
    _patientNotesController.clear();
    _examinationNotesController.clear();
    _diagnosisNotesController.clear();
    _treatmentNotesController.clear();
    _ageController.clear();
    _gender = null;
    _useAge = false;
    _dateOfBirth = null;

    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
                title: 'Point of Service',
              ),
              SizedBox(
                height: sy(20),
              ),
              Expanded(
                child: BlocConsumer<PointOfServiceBloc, PointOfServiceState>(
                  listener: (context, state) {
                    if (state is PointOfServiceIdle) {
                      if (state.checkIn != null) {
                        di<NotificationsService>().showSuccesssNotification(
                          title: 'Record saved',
                          message:
                              'Record for ${state.checkIn?.patient.user.firstName}'
                              ' saved!',
                        );

                        showMacosAlertDialog<void>(
                          context: context,
                          builder: (_) => MacosAlertDialog(
                            appIcon: const FlutterLogo(
                              size: 56,
                            ),
                            title: const Text('Prescription'),
                            message: const Text(
                              'Will the patient be requiring a prescription',
                            ),
                            primaryButton: UtanoButton(
                              text: 'Yes',
                              onTap: () {
                                context.goBack();
                                _pageController.animateToPage(
                                  2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              },
                            ),
                            secondaryButton: UtanoButton(
                              text: 'Complete Session',
                              onTap: () {
                                context.goBack();
                                di<NotificationsService>()
                                    .showSuccesssNotification(
                                  title: 'Session complete',
                                  message: 'Records Saved!',
                                );
                                // clear all controllers
                                _clearControllersAndFormFields();
                              },
                            ),
                          ),
                        );
                      }

                      if (state.prescription != null) {
                        di<NotificationsService>().showSuccesssNotification(
                          title: 'Prescription recorded',
                          message: 'Prescription saved',
                        );

                        showMacosAlertDialog<void>(
                          context: context,
                          builder: (_) => MacosAlertDialog(
                            appIcon: const FlutterLogo(
                              size: 56,
                            ),
                            title: const Text('Print Prescription'),
                            message: const Text(
                              'Do you need to print the prescription',
                            ),
                            primaryButton: UtanoButton(
                              text: 'Yes',
                              onTap: () {
                                // TODO(iamngoni): print prescription
                                context.goBack();
                              },
                            ),
                            secondaryButton: UtanoButton(
                              text: 'No',
                              onTap: () {
                                context.goBack();
                                di<NotificationsService>()
                                    .showSuccesssNotification(
                                  title: 'Session complete',
                                  message: 'Records Saved!',
                                );
                                // clear all controllers
                                _clearControllersAndFormFields();
                                context
                                    .read<PointOfServiceBloc>()
                                    .add(const ResetToIdle());
                              },
                            ),
                          ),
                        );
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is PointOfServiceLoading) {
                      return const Center(
                        child: LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      );
                    }

                    if (state is PointOfServiceError) {
                      return ExceptionWidget(
                        error: state.error,
                        onRetry: _checkInPatient,
                        onGoBack: () => context
                            .read<PointOfServiceBloc>()
                            .add(const ResetToIdle()),
                      );
                    }

                    return PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CheckInStage1(
                          pageController: _pageController,
                          firstNameController: _firstNameController,
                          lastNameController: _lastNameController,
                          mobileNumberController: _mobileNumberController,
                          addressController: _addressController,
                          nationalIdNumberController:
                              _nationalIdNumberController,
                          temperatureController: _temperatureController,
                          systolicBloodPressureController:
                              _systolicBloodPressureController,
                          diastolicBloodPressureController:
                              _diastolicBloodPressureController,
                          pulseController: _pulseController,
                          respiratoryRateController: _respiratoryRateController,
                          gender: _gender,
                          useAge: _useAge,
                          dateOfBirth: _dateOfBirth,
                          ageController: _ageController,
                          onUpdateGender: _updateGender,
                          onUpdateUseAge: _updateUseAge,
                          onUpdateDateOfBirth: _updateDateOfBirth,
                        ),
                        CheckInStage2(
                          patientNotesController: _patientNotesController,
                          examinationNotesController:
                              _examinationNotesController,
                          diagnosisNotesController: _diagnosisNotesController,
                          treatmentNotesController: _treatmentNotesController,
                          pageController: _pageController,
                          onSubmit: _checkInPatient,
                        ),
                        const CheckInPrescriptionStage(),
                      ],
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
