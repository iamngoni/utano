// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Prescription _$PrescriptionFromJson(Map<String, dynamic> json) {
  return _Prescription.fromJson(json);
}

/// @nodoc
mixin _$Prescription {
  String get id => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get patient => throw _privateConstructorUsedError;
  @JsonKey(name: 'prescription_number')
  String get prescriptionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'prepared_at')
  String get preparedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'health_institution')
  String get healthInstitution => throw _privateConstructorUsedError;
  @JsonKey(name: 'prepared_by')
  String get preparedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in')
  String get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'prescription_items')
  List<PrescriptionItem> get prescriptionItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrescriptionCopyWith<Prescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionCopyWith<$Res> {
  factory $PrescriptionCopyWith(
          Prescription value, $Res Function(Prescription) then) =
      _$PrescriptionCopyWithImpl<$Res, Prescription>;
  @useResult
  $Res call(
      {String id,
      String notes,
      String patient,
      @JsonKey(name: 'prescription_number')
          String prescriptionNumber,
      @JsonKey(name: 'prepared_at')
          String preparedAt,
      @JsonKey(name: 'health_institution')
          String healthInstitution,
      @JsonKey(name: 'prepared_by')
          String preparedBy,
      @JsonKey(name: 'check_in')
          String checkIn,
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @JsonKey(name: 'prescription_items')
          List<PrescriptionItem> prescriptionItems});
}

/// @nodoc
class _$PrescriptionCopyWithImpl<$Res, $Val extends Prescription>
    implements $PrescriptionCopyWith<$Res> {
  _$PrescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notes = null,
    Object? patient = null,
    Object? prescriptionNumber = null,
    Object? preparedAt = null,
    Object? healthInstitution = null,
    Object? preparedBy = null,
    Object? checkIn = null,
    Object? createdAt = null,
    Object? prescriptionItems = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as String,
      prescriptionNumber: null == prescriptionNumber
          ? _value.prescriptionNumber
          : prescriptionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      preparedAt: null == preparedAt
          ? _value.preparedAt
          : preparedAt // ignore: cast_nullable_to_non_nullable
              as String,
      healthInstitution: null == healthInstitution
          ? _value.healthInstitution
          : healthInstitution // ignore: cast_nullable_to_non_nullable
              as String,
      preparedBy: null == preparedBy
          ? _value.preparedBy
          : preparedBy // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: null == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prescriptionItems: null == prescriptionItems
          ? _value.prescriptionItems
          : prescriptionItems // ignore: cast_nullable_to_non_nullable
              as List<PrescriptionItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrescriptionCopyWith<$Res>
    implements $PrescriptionCopyWith<$Res> {
  factory _$$_PrescriptionCopyWith(
          _$_Prescription value, $Res Function(_$_Prescription) then) =
      __$$_PrescriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String notes,
      String patient,
      @JsonKey(name: 'prescription_number')
          String prescriptionNumber,
      @JsonKey(name: 'prepared_at')
          String preparedAt,
      @JsonKey(name: 'health_institution')
          String healthInstitution,
      @JsonKey(name: 'prepared_by')
          String preparedBy,
      @JsonKey(name: 'check_in')
          String checkIn,
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @JsonKey(name: 'prescription_items')
          List<PrescriptionItem> prescriptionItems});
}

/// @nodoc
class __$$_PrescriptionCopyWithImpl<$Res>
    extends _$PrescriptionCopyWithImpl<$Res, _$_Prescription>
    implements _$$_PrescriptionCopyWith<$Res> {
  __$$_PrescriptionCopyWithImpl(
      _$_Prescription _value, $Res Function(_$_Prescription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notes = null,
    Object? patient = null,
    Object? prescriptionNumber = null,
    Object? preparedAt = null,
    Object? healthInstitution = null,
    Object? preparedBy = null,
    Object? checkIn = null,
    Object? createdAt = null,
    Object? prescriptionItems = null,
  }) {
    return _then(_$_Prescription(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as String,
      prescriptionNumber: null == prescriptionNumber
          ? _value.prescriptionNumber
          : prescriptionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      preparedAt: null == preparedAt
          ? _value.preparedAt
          : preparedAt // ignore: cast_nullable_to_non_nullable
              as String,
      healthInstitution: null == healthInstitution
          ? _value.healthInstitution
          : healthInstitution // ignore: cast_nullable_to_non_nullable
              as String,
      preparedBy: null == preparedBy
          ? _value.preparedBy
          : preparedBy // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: null == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prescriptionItems: null == prescriptionItems
          ? _value._prescriptionItems
          : prescriptionItems // ignore: cast_nullable_to_non_nullable
              as List<PrescriptionItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Prescription extends _Prescription {
  const _$_Prescription(
      {required this.id,
      required this.notes,
      required this.patient,
      @JsonKey(name: 'prescription_number')
          required this.prescriptionNumber,
      @JsonKey(name: 'prepared_at')
          required this.preparedAt,
      @JsonKey(name: 'health_institution')
          required this.healthInstitution,
      @JsonKey(name: 'prepared_by')
          required this.preparedBy,
      @JsonKey(name: 'check_in')
          required this.checkIn,
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @JsonKey(name: 'prescription_items')
          required final List<PrescriptionItem> prescriptionItems})
      : _prescriptionItems = prescriptionItems,
        super._();

  factory _$_Prescription.fromJson(Map<String, dynamic> json) =>
      _$$_PrescriptionFromJson(json);

  @override
  final String id;
  @override
  final String notes;
  @override
  final String patient;
  @override
  @JsonKey(name: 'prescription_number')
  final String prescriptionNumber;
  @override
  @JsonKey(name: 'prepared_at')
  final String preparedAt;
  @override
  @JsonKey(name: 'health_institution')
  final String healthInstitution;
  @override
  @JsonKey(name: 'prepared_by')
  final String preparedBy;
  @override
  @JsonKey(name: 'check_in')
  final String checkIn;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<PrescriptionItem> _prescriptionItems;
  @override
  @JsonKey(name: 'prescription_items')
  List<PrescriptionItem> get prescriptionItems {
    if (_prescriptionItems is EqualUnmodifiableListView)
      return _prescriptionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prescriptionItems);
  }

  @override
  String toString() {
    return 'Prescription(id: $id, notes: $notes, patient: $patient, prescriptionNumber: $prescriptionNumber, preparedAt: $preparedAt, healthInstitution: $healthInstitution, preparedBy: $preparedBy, checkIn: $checkIn, createdAt: $createdAt, prescriptionItems: $prescriptionItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Prescription &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.prescriptionNumber, prescriptionNumber) ||
                other.prescriptionNumber == prescriptionNumber) &&
            (identical(other.preparedAt, preparedAt) ||
                other.preparedAt == preparedAt) &&
            (identical(other.healthInstitution, healthInstitution) ||
                other.healthInstitution == healthInstitution) &&
            (identical(other.preparedBy, preparedBy) ||
                other.preparedBy == preparedBy) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._prescriptionItems, _prescriptionItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      notes,
      patient,
      prescriptionNumber,
      preparedAt,
      healthInstitution,
      preparedBy,
      checkIn,
      createdAt,
      const DeepCollectionEquality().hash(_prescriptionItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrescriptionCopyWith<_$_Prescription> get copyWith =>
      __$$_PrescriptionCopyWithImpl<_$_Prescription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrescriptionToJson(
      this,
    );
  }
}

abstract class _Prescription extends Prescription {
  const factory _Prescription(
          {required final String id,
          required final String notes,
          required final String patient,
          @JsonKey(name: 'prescription_number')
              required final String prescriptionNumber,
          @JsonKey(name: 'prepared_at')
              required final String preparedAt,
          @JsonKey(name: 'health_institution')
              required final String healthInstitution,
          @JsonKey(name: 'prepared_by')
              required final String preparedBy,
          @JsonKey(name: 'check_in')
              required final String checkIn,
          @JsonKey(name: 'created_at')
              required final DateTime createdAt,
          @JsonKey(name: 'prescription_items')
              required final List<PrescriptionItem> prescriptionItems}) =
      _$_Prescription;
  const _Prescription._() : super._();

  factory _Prescription.fromJson(Map<String, dynamic> json) =
      _$_Prescription.fromJson;

  @override
  String get id;
  @override
  String get notes;
  @override
  String get patient;
  @override
  @JsonKey(name: 'prescription_number')
  String get prescriptionNumber;
  @override
  @JsonKey(name: 'prepared_at')
  String get preparedAt;
  @override
  @JsonKey(name: 'health_institution')
  String get healthInstitution;
  @override
  @JsonKey(name: 'prepared_by')
  String get preparedBy;
  @override
  @JsonKey(name: 'check_in')
  String get checkIn;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'prescription_items')
  List<PrescriptionItem> get prescriptionItems;
  @override
  @JsonKey(ignore: true)
  _$$_PrescriptionCopyWith<_$_Prescription> get copyWith =>
      throw _privateConstructorUsedError;
}
