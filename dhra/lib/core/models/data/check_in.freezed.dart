// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckIn _$CheckInFromJson(Map<String, dynamic> json) {
  return _CheckIn.fromJson(json);
}

/// @nodoc
mixin _$CheckIn {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  String get mobileNumber => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  CheckInStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'health_institution')
  HealthInstitution get healthInstitution => throw _privateConstructorUsedError;
  Patient get patient => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'systolic_blood_pressure')
  double? get systolicBloodPressure => throw _privateConstructorUsedError;
  @JsonKey(name: 'diastolic_blood_pressure')
  double? get diastolicBloodPressure => throw _privateConstructorUsedError;
  double? get pulse => throw _privateConstructorUsedError;
  @JsonKey(name: 'respiratory_rate')
  double? get respiratoryRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_notes')
  String? get patientNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'examination_notes')
  String? get examinationNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'diagnosis_notes')
  String? get diagnosisNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatment_notes')
  String? get treatmentNotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckInCopyWith<CheckIn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInCopyWith<$Res> {
  factory $CheckInCopyWith(CheckIn value, $Res Function(CheckIn) then) =
      _$CheckInCopyWithImpl<$Res, CheckIn>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'date_of_birth') DateTime dateOfBirth,
      String address,
      @JsonKey(name: 'mobile_number') String mobileNumber,
      String gender,
      CheckInStatus status,
      @JsonKey(name: 'health_institution') HealthInstitution healthInstitution,
      Patient patient,
      double? temperature,
      @JsonKey(name: 'systolic_blood_pressure') double? systolicBloodPressure,
      @JsonKey(name: 'diastolic_blood_pressure') double? diastolicBloodPressure,
      double? pulse,
      @JsonKey(name: 'respiratory_rate') double? respiratoryRate,
      @JsonKey(name: 'patient_notes') String? patientNotes,
      @JsonKey(name: 'examination_notes') String? examinationNotes,
      @JsonKey(name: 'diagnosis_notes') String? diagnosisNotes,
      @JsonKey(name: 'treatment_notes') String? treatmentNotes});

  $HealthInstitutionCopyWith<$Res> get healthInstitution;
  $PatientCopyWith<$Res> get patient;
}

/// @nodoc
class _$CheckInCopyWithImpl<$Res, $Val extends CheckIn>
    implements $CheckInCopyWith<$Res> {
  _$CheckInCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? address = null,
    Object? mobileNumber = null,
    Object? gender = null,
    Object? status = null,
    Object? healthInstitution = null,
    Object? patient = null,
    Object? temperature = freezed,
    Object? systolicBloodPressure = freezed,
    Object? diastolicBloodPressure = freezed,
    Object? pulse = freezed,
    Object? respiratoryRate = freezed,
    Object? patientNotes = freezed,
    Object? examinationNotes = freezed,
    Object? diagnosisNotes = freezed,
    Object? treatmentNotes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckInStatus,
      healthInstitution: null == healthInstitution
          ? _value.healthInstitution
          : healthInstitution // ignore: cast_nullable_to_non_nullable
              as HealthInstitution,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      systolicBloodPressure: freezed == systolicBloodPressure
          ? _value.systolicBloodPressure
          : systolicBloodPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      diastolicBloodPressure: freezed == diastolicBloodPressure
          ? _value.diastolicBloodPressure
          : diastolicBloodPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      pulse: freezed == pulse
          ? _value.pulse
          : pulse // ignore: cast_nullable_to_non_nullable
              as double?,
      respiratoryRate: freezed == respiratoryRate
          ? _value.respiratoryRate
          : respiratoryRate // ignore: cast_nullable_to_non_nullable
              as double?,
      patientNotes: freezed == patientNotes
          ? _value.patientNotes
          : patientNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      examinationNotes: freezed == examinationNotes
          ? _value.examinationNotes
          : examinationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      diagnosisNotes: freezed == diagnosisNotes
          ? _value.diagnosisNotes
          : diagnosisNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentNotes: freezed == treatmentNotes
          ? _value.treatmentNotes
          : treatmentNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HealthInstitutionCopyWith<$Res> get healthInstitution {
    return $HealthInstitutionCopyWith<$Res>(_value.healthInstitution, (value) {
      return _then(_value.copyWith(healthInstitution: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res> get patient {
    return $PatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CheckInCopyWith<$Res> implements $CheckInCopyWith<$Res> {
  factory _$$_CheckInCopyWith(
          _$_CheckIn value, $Res Function(_$_CheckIn) then) =
      __$$_CheckInCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'date_of_birth') DateTime dateOfBirth,
      String address,
      @JsonKey(name: 'mobile_number') String mobileNumber,
      String gender,
      CheckInStatus status,
      @JsonKey(name: 'health_institution') HealthInstitution healthInstitution,
      Patient patient,
      double? temperature,
      @JsonKey(name: 'systolic_blood_pressure') double? systolicBloodPressure,
      @JsonKey(name: 'diastolic_blood_pressure') double? diastolicBloodPressure,
      double? pulse,
      @JsonKey(name: 'respiratory_rate') double? respiratoryRate,
      @JsonKey(name: 'patient_notes') String? patientNotes,
      @JsonKey(name: 'examination_notes') String? examinationNotes,
      @JsonKey(name: 'diagnosis_notes') String? diagnosisNotes,
      @JsonKey(name: 'treatment_notes') String? treatmentNotes});

  @override
  $HealthInstitutionCopyWith<$Res> get healthInstitution;
  @override
  $PatientCopyWith<$Res> get patient;
}

/// @nodoc
class __$$_CheckInCopyWithImpl<$Res>
    extends _$CheckInCopyWithImpl<$Res, _$_CheckIn>
    implements _$$_CheckInCopyWith<$Res> {
  __$$_CheckInCopyWithImpl(_$_CheckIn _value, $Res Function(_$_CheckIn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? address = null,
    Object? mobileNumber = null,
    Object? gender = null,
    Object? status = null,
    Object? healthInstitution = null,
    Object? patient = null,
    Object? temperature = freezed,
    Object? systolicBloodPressure = freezed,
    Object? diastolicBloodPressure = freezed,
    Object? pulse = freezed,
    Object? respiratoryRate = freezed,
    Object? patientNotes = freezed,
    Object? examinationNotes = freezed,
    Object? diagnosisNotes = freezed,
    Object? treatmentNotes = freezed,
  }) {
    return _then(_$_CheckIn(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckInStatus,
      healthInstitution: null == healthInstitution
          ? _value.healthInstitution
          : healthInstitution // ignore: cast_nullable_to_non_nullable
              as HealthInstitution,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      systolicBloodPressure: freezed == systolicBloodPressure
          ? _value.systolicBloodPressure
          : systolicBloodPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      diastolicBloodPressure: freezed == diastolicBloodPressure
          ? _value.diastolicBloodPressure
          : diastolicBloodPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      pulse: freezed == pulse
          ? _value.pulse
          : pulse // ignore: cast_nullable_to_non_nullable
              as double?,
      respiratoryRate: freezed == respiratoryRate
          ? _value.respiratoryRate
          : respiratoryRate // ignore: cast_nullable_to_non_nullable
              as double?,
      patientNotes: freezed == patientNotes
          ? _value.patientNotes
          : patientNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      examinationNotes: freezed == examinationNotes
          ? _value.examinationNotes
          : examinationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      diagnosisNotes: freezed == diagnosisNotes
          ? _value.diagnosisNotes
          : diagnosisNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentNotes: freezed == treatmentNotes
          ? _value.treatmentNotes
          : treatmentNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckIn extends _CheckIn {
  const _$_CheckIn(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      @JsonKey(name: 'date_of_birth') required this.dateOfBirth,
      required this.address,
      @JsonKey(name: 'mobile_number') required this.mobileNumber,
      required this.gender,
      required this.status,
      @JsonKey(name: 'health_institution') required this.healthInstitution,
      required this.patient,
      this.temperature,
      @JsonKey(name: 'systolic_blood_pressure') this.systolicBloodPressure,
      @JsonKey(name: 'diastolic_blood_pressure') this.diastolicBloodPressure,
      this.pulse,
      @JsonKey(name: 'respiratory_rate') this.respiratoryRate,
      @JsonKey(name: 'patient_notes') this.patientNotes,
      @JsonKey(name: 'examination_notes') this.examinationNotes,
      @JsonKey(name: 'diagnosis_notes') this.diagnosisNotes,
      @JsonKey(name: 'treatment_notes') this.treatmentNotes})
      : super._();

  factory _$_CheckIn.fromJson(Map<String, dynamic> json) =>
      _$$_CheckInFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'date_of_birth')
  final DateTime dateOfBirth;
  @override
  final String address;
  @override
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  @override
  final String gender;
  @override
  final CheckInStatus status;
  @override
  @JsonKey(name: 'health_institution')
  final HealthInstitution healthInstitution;
  @override
  final Patient patient;
  @override
  final double? temperature;
  @override
  @JsonKey(name: 'systolic_blood_pressure')
  final double? systolicBloodPressure;
  @override
  @JsonKey(name: 'diastolic_blood_pressure')
  final double? diastolicBloodPressure;
  @override
  final double? pulse;
  @override
  @JsonKey(name: 'respiratory_rate')
  final double? respiratoryRate;
  @override
  @JsonKey(name: 'patient_notes')
  final String? patientNotes;
  @override
  @JsonKey(name: 'examination_notes')
  final String? examinationNotes;
  @override
  @JsonKey(name: 'diagnosis_notes')
  final String? diagnosisNotes;
  @override
  @JsonKey(name: 'treatment_notes')
  final String? treatmentNotes;

  @override
  String toString() {
    return 'CheckIn(id: $id, createdAt: $createdAt, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, address: $address, mobileNumber: $mobileNumber, gender: $gender, status: $status, healthInstitution: $healthInstitution, patient: $patient, temperature: $temperature, systolicBloodPressure: $systolicBloodPressure, diastolicBloodPressure: $diastolicBloodPressure, pulse: $pulse, respiratoryRate: $respiratoryRate, patientNotes: $patientNotes, examinationNotes: $examinationNotes, diagnosisNotes: $diagnosisNotes, treatmentNotes: $treatmentNotes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckIn &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.healthInstitution, healthInstitution) ||
                other.healthInstitution == healthInstitution) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.systolicBloodPressure, systolicBloodPressure) ||
                other.systolicBloodPressure == systolicBloodPressure) &&
            (identical(other.diastolicBloodPressure, diastolicBloodPressure) ||
                other.diastolicBloodPressure == diastolicBloodPressure) &&
            (identical(other.pulse, pulse) || other.pulse == pulse) &&
            (identical(other.respiratoryRate, respiratoryRate) ||
                other.respiratoryRate == respiratoryRate) &&
            (identical(other.patientNotes, patientNotes) ||
                other.patientNotes == patientNotes) &&
            (identical(other.examinationNotes, examinationNotes) ||
                other.examinationNotes == examinationNotes) &&
            (identical(other.diagnosisNotes, diagnosisNotes) ||
                other.diagnosisNotes == diagnosisNotes) &&
            (identical(other.treatmentNotes, treatmentNotes) ||
                other.treatmentNotes == treatmentNotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        firstName,
        lastName,
        dateOfBirth,
        address,
        mobileNumber,
        gender,
        status,
        healthInstitution,
        patient,
        temperature,
        systolicBloodPressure,
        diastolicBloodPressure,
        pulse,
        respiratoryRate,
        patientNotes,
        examinationNotes,
        diagnosisNotes,
        treatmentNotes
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckInCopyWith<_$_CheckIn> get copyWith =>
      __$$_CheckInCopyWithImpl<_$_CheckIn>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckInToJson(
      this,
    );
  }
}

abstract class _CheckIn extends CheckIn {
  const factory _CheckIn(
      {required final String id,
      @JsonKey(name: 'created_at')
          required final DateTime createdAt,
      @JsonKey(name: 'first_name')
          required final String firstName,
      @JsonKey(name: 'last_name')
          required final String lastName,
      @JsonKey(name: 'date_of_birth')
          required final DateTime dateOfBirth,
      required final String address,
      @JsonKey(name: 'mobile_number')
          required final String mobileNumber,
      required final String gender,
      required final CheckInStatus status,
      @JsonKey(name: 'health_institution')
          required final HealthInstitution healthInstitution,
      required final Patient patient,
      final double? temperature,
      @JsonKey(name: 'systolic_blood_pressure')
          final double? systolicBloodPressure,
      @JsonKey(name: 'diastolic_blood_pressure')
          final double? diastolicBloodPressure,
      final double? pulse,
      @JsonKey(name: 'respiratory_rate')
          final double? respiratoryRate,
      @JsonKey(name: 'patient_notes')
          final String? patientNotes,
      @JsonKey(name: 'examination_notes')
          final String? examinationNotes,
      @JsonKey(name: 'diagnosis_notes')
          final String? diagnosisNotes,
      @JsonKey(name: 'treatment_notes')
          final String? treatmentNotes}) = _$_CheckIn;
  const _CheckIn._() : super._();

  factory _CheckIn.fromJson(Map<String, dynamic> json) = _$_CheckIn.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'date_of_birth')
  DateTime get dateOfBirth;
  @override
  String get address;
  @override
  @JsonKey(name: 'mobile_number')
  String get mobileNumber;
  @override
  String get gender;
  @override
  CheckInStatus get status;
  @override
  @JsonKey(name: 'health_institution')
  HealthInstitution get healthInstitution;
  @override
  Patient get patient;
  @override
  double? get temperature;
  @override
  @JsonKey(name: 'systolic_blood_pressure')
  double? get systolicBloodPressure;
  @override
  @JsonKey(name: 'diastolic_blood_pressure')
  double? get diastolicBloodPressure;
  @override
  double? get pulse;
  @override
  @JsonKey(name: 'respiratory_rate')
  double? get respiratoryRate;
  @override
  @JsonKey(name: 'patient_notes')
  String? get patientNotes;
  @override
  @JsonKey(name: 'examination_notes')
  String? get examinationNotes;
  @override
  @JsonKey(name: 'diagnosis_notes')
  String? get diagnosisNotes;
  @override
  @JsonKey(name: 'treatment_notes')
  String? get treatmentNotes;
  @override
  @JsonKey(ignore: true)
  _$$_CheckInCopyWith<_$_CheckIn> get copyWith =>
      throw _privateConstructorUsedError;
}
