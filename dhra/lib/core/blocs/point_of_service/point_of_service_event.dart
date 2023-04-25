part of 'point_of_service_bloc.dart';

abstract class PointOfServiceEvent extends Equatable {
  const PointOfServiceEvent();
}

class CheckInPatient extends PointOfServiceEvent {
  const CheckInPatient({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.gender,
    required this.temperature,
    required this.systolicBloodPressure,
    required this.diastolicBloodPressure,
    required this.pulse,
    required this.respiratoryRate,
    required this.patientNotes,
    required this.examinationNotes,
    required this.diagnosisNotes,
    required this.treatmentNotes,
    this.address,
    this.age,
    this.dateOfBirth,
  });

  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String gender;
  final double temperature;
  final double systolicBloodPressure;
  final double diastolicBloodPressure;
  final double pulse;
  final double respiratoryRate;
  final String patientNotes;
  final String examinationNotes;
  final String diagnosisNotes;
  final String treatmentNotes;
  final String? address;
  final int? age;
  final DateTime? dateOfBirth;

  @override
  List<Object> get props => [];
}

class PrescribeMedication extends PointOfServiceEvent {
  const PrescribeMedication({
    required this.prescriptionItems,
    required this.checkIn,
  });
  final List<PosPrescriptionItem> prescriptionItems;
  final CheckIn checkIn;

  @override
  List<Object> get props => [prescriptionItems, checkIn];
}

class ResetToIdle extends PointOfServiceEvent {
  const ResetToIdle();
  @override
  List<Object> get props => [];
}
