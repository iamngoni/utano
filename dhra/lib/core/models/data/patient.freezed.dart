// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  User get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'medical_record_number')
  String get medicalRecordNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_of_birth')
  String get placeOfBirth => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_type')
  String get bloodType => throw _privateConstructorUsedError;
  @JsonKey(name: 'fitzpatrick_skin_type')
  String get fitzpatrickSkinType => throw _privateConstructorUsedError;
  bool get wheelchair => throw _privateConstructorUsedError;
  @JsonKey(name: 'father_name')
  String get fatherName => throw _privateConstructorUsedError;
  @JsonKey(name: 'mother_name')
  String get motherName => throw _privateConstructorUsedError;
  String get occupation => throw _privateConstructorUsedError;
  @JsonKey(name: 'registered_at')
  HealthInstitution get registeredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'registered_on')
  DateTime get registeredOn => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'marital_status')
  MaritalStatus? get maritalStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'employment_status')
  EmploymentStatus? get employmentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'national_id_number')
  String? get nationalIdNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {User user,
      @JsonKey(name: 'medical_record_number') String medicalRecordNumber,
      @JsonKey(name: 'place_of_birth') String placeOfBirth,
      String address,
      @JsonKey(name: 'blood_type') String bloodType,
      @JsonKey(name: 'fitzpatrick_skin_type') String fitzpatrickSkinType,
      bool wheelchair,
      @JsonKey(name: 'father_name') String fatherName,
      @JsonKey(name: 'mother_name') String motherName,
      String occupation,
      @JsonKey(name: 'registered_at') HealthInstitution registeredAt,
      @JsonKey(name: 'registered_on') DateTime registeredOn,
      double? height,
      double? weight,
      @JsonKey(name: 'mobile_number') String? mobileNumber,
      @JsonKey(name: 'marital_status') MaritalStatus? maritalStatus,
      @JsonKey(name: 'employment_status') EmploymentStatus? employmentStatus,
      @JsonKey(name: 'national_id_number') String? nationalIdNumber,
      @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth});

  $UserCopyWith<$Res> get user;
  $HealthInstitutionCopyWith<$Res> get registeredAt;
  $MaritalStatusCopyWith<$Res>? get maritalStatus;
  $EmploymentStatusCopyWith<$Res>? get employmentStatus;
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? medicalRecordNumber = null,
    Object? placeOfBirth = null,
    Object? address = null,
    Object? bloodType = null,
    Object? fitzpatrickSkinType = null,
    Object? wheelchair = null,
    Object? fatherName = null,
    Object? motherName = null,
    Object? occupation = null,
    Object? registeredAt = null,
    Object? registeredOn = null,
    Object? height = freezed,
    Object? weight = freezed,
    Object? mobileNumber = freezed,
    Object? maritalStatus = freezed,
    Object? employmentStatus = freezed,
    Object? nationalIdNumber = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      medicalRecordNumber: null == medicalRecordNumber
          ? _value.medicalRecordNumber
          : medicalRecordNumber // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfBirth: null == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bloodType: null == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String,
      fitzpatrickSkinType: null == fitzpatrickSkinType
          ? _value.fitzpatrickSkinType
          : fitzpatrickSkinType // ignore: cast_nullable_to_non_nullable
              as String,
      wheelchair: null == wheelchair
          ? _value.wheelchair
          : wheelchair // ignore: cast_nullable_to_non_nullable
              as bool,
      fatherName: null == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String,
      motherName: null == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as HealthInstitution,
      registeredOn: null == registeredOn
          ? _value.registeredOn
          : registeredOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as MaritalStatus?,
      employmentStatus: freezed == employmentStatus
          ? _value.employmentStatus
          : employmentStatus // ignore: cast_nullable_to_non_nullable
              as EmploymentStatus?,
      nationalIdNumber: freezed == nationalIdNumber
          ? _value.nationalIdNumber
          : nationalIdNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HealthInstitutionCopyWith<$Res> get registeredAt {
    return $HealthInstitutionCopyWith<$Res>(_value.registeredAt, (value) {
      return _then(_value.copyWith(registeredAt: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaritalStatusCopyWith<$Res>? get maritalStatus {
    if (_value.maritalStatus == null) {
      return null;
    }

    return $MaritalStatusCopyWith<$Res>(_value.maritalStatus!, (value) {
      return _then(_value.copyWith(maritalStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EmploymentStatusCopyWith<$Res>? get employmentStatus {
    if (_value.employmentStatus == null) {
      return null;
    }

    return $EmploymentStatusCopyWith<$Res>(_value.employmentStatus!, (value) {
      return _then(_value.copyWith(employmentStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$_PatientCopyWith(
          _$_Patient value, $Res Function(_$_Patient) then) =
      __$$_PatientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      @JsonKey(name: 'medical_record_number') String medicalRecordNumber,
      @JsonKey(name: 'place_of_birth') String placeOfBirth,
      String address,
      @JsonKey(name: 'blood_type') String bloodType,
      @JsonKey(name: 'fitzpatrick_skin_type') String fitzpatrickSkinType,
      bool wheelchair,
      @JsonKey(name: 'father_name') String fatherName,
      @JsonKey(name: 'mother_name') String motherName,
      String occupation,
      @JsonKey(name: 'registered_at') HealthInstitution registeredAt,
      @JsonKey(name: 'registered_on') DateTime registeredOn,
      double? height,
      double? weight,
      @JsonKey(name: 'mobile_number') String? mobileNumber,
      @JsonKey(name: 'marital_status') MaritalStatus? maritalStatus,
      @JsonKey(name: 'employment_status') EmploymentStatus? employmentStatus,
      @JsonKey(name: 'national_id_number') String? nationalIdNumber,
      @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $HealthInstitutionCopyWith<$Res> get registeredAt;
  @override
  $MaritalStatusCopyWith<$Res>? get maritalStatus;
  @override
  $EmploymentStatusCopyWith<$Res>? get employmentStatus;
}

/// @nodoc
class __$$_PatientCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$_Patient>
    implements _$$_PatientCopyWith<$Res> {
  __$$_PatientCopyWithImpl(_$_Patient _value, $Res Function(_$_Patient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? medicalRecordNumber = null,
    Object? placeOfBirth = null,
    Object? address = null,
    Object? bloodType = null,
    Object? fitzpatrickSkinType = null,
    Object? wheelchair = null,
    Object? fatherName = null,
    Object? motherName = null,
    Object? occupation = null,
    Object? registeredAt = null,
    Object? registeredOn = null,
    Object? height = freezed,
    Object? weight = freezed,
    Object? mobileNumber = freezed,
    Object? maritalStatus = freezed,
    Object? employmentStatus = freezed,
    Object? nationalIdNumber = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_$_Patient(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      medicalRecordNumber: null == medicalRecordNumber
          ? _value.medicalRecordNumber
          : medicalRecordNumber // ignore: cast_nullable_to_non_nullable
              as String,
      placeOfBirth: null == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bloodType: null == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String,
      fitzpatrickSkinType: null == fitzpatrickSkinType
          ? _value.fitzpatrickSkinType
          : fitzpatrickSkinType // ignore: cast_nullable_to_non_nullable
              as String,
      wheelchair: null == wheelchair
          ? _value.wheelchair
          : wheelchair // ignore: cast_nullable_to_non_nullable
              as bool,
      fatherName: null == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String,
      motherName: null == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as HealthInstitution,
      registeredOn: null == registeredOn
          ? _value.registeredOn
          : registeredOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as MaritalStatus?,
      employmentStatus: freezed == employmentStatus
          ? _value.employmentStatus
          : employmentStatus // ignore: cast_nullable_to_non_nullable
              as EmploymentStatus?,
      nationalIdNumber: freezed == nationalIdNumber
          ? _value.nationalIdNumber
          : nationalIdNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Patient implements _Patient {
  const _$_Patient(
      {required this.user,
      @JsonKey(name: 'medical_record_number') required this.medicalRecordNumber,
      @JsonKey(name: 'place_of_birth') required this.placeOfBirth,
      required this.address,
      @JsonKey(name: 'blood_type') required this.bloodType,
      @JsonKey(name: 'fitzpatrick_skin_type') required this.fitzpatrickSkinType,
      required this.wheelchair,
      @JsonKey(name: 'father_name') required this.fatherName,
      @JsonKey(name: 'mother_name') required this.motherName,
      required this.occupation,
      @JsonKey(name: 'registered_at') required this.registeredAt,
      @JsonKey(name: 'registered_on') required this.registeredOn,
      this.height,
      this.weight,
      @JsonKey(name: 'mobile_number') this.mobileNumber,
      @JsonKey(name: 'marital_status') this.maritalStatus,
      @JsonKey(name: 'employment_status') this.employmentStatus,
      @JsonKey(name: 'national_id_number') this.nationalIdNumber,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth});

  factory _$_Patient.fromJson(Map<String, dynamic> json) =>
      _$$_PatientFromJson(json);

  @override
  final User user;
  @override
  @JsonKey(name: 'medical_record_number')
  final String medicalRecordNumber;
  @override
  @JsonKey(name: 'place_of_birth')
  final String placeOfBirth;
  @override
  final String address;
  @override
  @JsonKey(name: 'blood_type')
  final String bloodType;
  @override
  @JsonKey(name: 'fitzpatrick_skin_type')
  final String fitzpatrickSkinType;
  @override
  final bool wheelchair;
  @override
  @JsonKey(name: 'father_name')
  final String fatherName;
  @override
  @JsonKey(name: 'mother_name')
  final String motherName;
  @override
  final String occupation;
  @override
  @JsonKey(name: 'registered_at')
  final HealthInstitution registeredAt;
  @override
  @JsonKey(name: 'registered_on')
  final DateTime registeredOn;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  @JsonKey(name: 'mobile_number')
  final String? mobileNumber;
  @override
  @JsonKey(name: 'marital_status')
  final MaritalStatus? maritalStatus;
  @override
  @JsonKey(name: 'employment_status')
  final EmploymentStatus? employmentStatus;
  @override
  @JsonKey(name: 'national_id_number')
  final String? nationalIdNumber;
  @override
  @JsonKey(name: 'date_of_birth')
  final DateTime? dateOfBirth;

  @override
  String toString() {
    return 'Patient(user: $user, medicalRecordNumber: $medicalRecordNumber, placeOfBirth: $placeOfBirth, address: $address, bloodType: $bloodType, fitzpatrickSkinType: $fitzpatrickSkinType, wheelchair: $wheelchair, fatherName: $fatherName, motherName: $motherName, occupation: $occupation, registeredAt: $registeredAt, registeredOn: $registeredOn, height: $height, weight: $weight, mobileNumber: $mobileNumber, maritalStatus: $maritalStatus, employmentStatus: $employmentStatus, nationalIdNumber: $nationalIdNumber, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Patient &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.medicalRecordNumber, medicalRecordNumber) ||
                other.medicalRecordNumber == medicalRecordNumber) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.fitzpatrickSkinType, fitzpatrickSkinType) ||
                other.fitzpatrickSkinType == fitzpatrickSkinType) &&
            (identical(other.wheelchair, wheelchair) ||
                other.wheelchair == wheelchair) &&
            (identical(other.fatherName, fatherName) ||
                other.fatherName == fatherName) &&
            (identical(other.motherName, motherName) ||
                other.motherName == motherName) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.registeredAt, registeredAt) ||
                other.registeredAt == registeredAt) &&
            (identical(other.registeredOn, registeredOn) ||
                other.registeredOn == registeredOn) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.employmentStatus, employmentStatus) ||
                other.employmentStatus == employmentStatus) &&
            (identical(other.nationalIdNumber, nationalIdNumber) ||
                other.nationalIdNumber == nationalIdNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        user,
        medicalRecordNumber,
        placeOfBirth,
        address,
        bloodType,
        fitzpatrickSkinType,
        wheelchair,
        fatherName,
        motherName,
        occupation,
        registeredAt,
        registeredOn,
        height,
        weight,
        mobileNumber,
        maritalStatus,
        employmentStatus,
        nationalIdNumber,
        dateOfBirth
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      __$$_PatientCopyWithImpl<_$_Patient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {required final User user,
      @JsonKey(name: 'medical_record_number')
          required final String medicalRecordNumber,
      @JsonKey(name: 'place_of_birth')
          required final String placeOfBirth,
      required final String address,
      @JsonKey(name: 'blood_type')
          required final String bloodType,
      @JsonKey(name: 'fitzpatrick_skin_type')
          required final String fitzpatrickSkinType,
      required final bool wheelchair,
      @JsonKey(name: 'father_name')
          required final String fatherName,
      @JsonKey(name: 'mother_name')
          required final String motherName,
      required final String occupation,
      @JsonKey(name: 'registered_at')
          required final HealthInstitution registeredAt,
      @JsonKey(name: 'registered_on')
          required final DateTime registeredOn,
      final double? height,
      final double? weight,
      @JsonKey(name: 'mobile_number')
          final String? mobileNumber,
      @JsonKey(name: 'marital_status')
          final MaritalStatus? maritalStatus,
      @JsonKey(name: 'employment_status')
          final EmploymentStatus? employmentStatus,
      @JsonKey(name: 'national_id_number')
          final String? nationalIdNumber,
      @JsonKey(name: 'date_of_birth')
          final DateTime? dateOfBirth}) = _$_Patient;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$_Patient.fromJson;

  @override
  User get user;
  @override
  @JsonKey(name: 'medical_record_number')
  String get medicalRecordNumber;
  @override
  @JsonKey(name: 'place_of_birth')
  String get placeOfBirth;
  @override
  String get address;
  @override
  @JsonKey(name: 'blood_type')
  String get bloodType;
  @override
  @JsonKey(name: 'fitzpatrick_skin_type')
  String get fitzpatrickSkinType;
  @override
  bool get wheelchair;
  @override
  @JsonKey(name: 'father_name')
  String get fatherName;
  @override
  @JsonKey(name: 'mother_name')
  String get motherName;
  @override
  String get occupation;
  @override
  @JsonKey(name: 'registered_at')
  HealthInstitution get registeredAt;
  @override
  @JsonKey(name: 'registered_on')
  DateTime get registeredOn;
  @override
  double? get height;
  @override
  double? get weight;
  @override
  @JsonKey(name: 'mobile_number')
  String? get mobileNumber;
  @override
  @JsonKey(name: 'marital_status')
  MaritalStatus? get maritalStatus;
  @override
  @JsonKey(name: 'employment_status')
  EmploymentStatus? get employmentStatus;
  @override
  @JsonKey(name: 'national_id_number')
  String? get nationalIdNumber;
  @override
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth;
  @override
  @JsonKey(ignore: true)
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      throw _privateConstructorUsedError;
}
