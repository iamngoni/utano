// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Prescription _$$_PrescriptionFromJson(Map<String, dynamic> json) =>
    _$_Prescription(
      id: json['id'] as String,
      notes: json['notes'] as String,
      patient: json['patient'] as String,
      prescriptionNumber: json['prescription_number'] as String,
      preparedAt: json['prepared_at'] as String,
      preparedBy: json['prepared_by'] as String,
      checkIn: json['check_in'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      prescriptionItems: (json['prescriptionItems'] as List<dynamic>)
          .map((e) => PrescriptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PrescriptionToJson(_$_Prescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notes': instance.notes,
      'patient': instance.patient,
      'prescription_number': instance.prescriptionNumber,
      'prepared_at': instance.preparedAt,
      'prepared_by': instance.preparedBy,
      'check_in': instance.checkIn,
      'created_at': instance.createdAt.toIso8601String(),
      'prescriptionItems':
          instance.prescriptionItems.map((e) => e.toJson()).toList(),
    };
