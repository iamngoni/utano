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
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/point_of_service/point_of_service_bloc.dart';
import '../../configs/colors.dart';
import '../../models/data/gender.dart';
import '../../services/di.dart';
import '../../services/notifications.dart';
import '../widgets/check_in_stage_1.dart';
import '../widgets/check_in_stage_2.dart';
import '../widgets/exception_widget.dart';
import '../widgets/loader_widget.dart';
import '../widgets/page_header.dart';

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

  Gender? _gender;

  void _updateGender(Gender? gender) => setState(() {
        _gender = gender;
      });

  void _checkInPatient() {
    context.read<PointOfServiceBloc>().add(
          CheckInPatient(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            mobileNumber: _mobileNumberController.text,
            gender: 'MALE',
            address: _addressController.text,
            // todo: fix here by adding a datetime picker
            age:
                (DateTime(1998, 10, 13).difference(DateTime.now()).inDays / 365)
                    .floor(),
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
                      if (state.patient != null) {
                        di<NotificationsService>().showSuccesssNotification(
                          title: 'Record saved',
                          message: 'Record for ${state.patient?.user.firstName}'
                              ' saved!',
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
                          onUpdateGender: _updateGender,
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
