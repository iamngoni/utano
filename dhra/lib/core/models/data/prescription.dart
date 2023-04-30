//
//  prescription
//  dhra
//
//  Created by Ngonidzashe Mangudya on 25/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import 'model.dart';
import 'prescription_item.dart';

part 'prescription.freezed.dart';
part 'prescription.g.dart';

@freezed
class Prescription with _$Prescription implements Model {
  const factory Prescription({
    required String id,
    required String notes,
    required String patient,
    @JsonKey(name: 'prescription_number') required String prescriptionNumber,
    @JsonKey(name: 'prepared_at') required String preparedAt,
    @JsonKey(name: 'prepared_by') required String preparedBy,
    @JsonKey(name: 'check_in') required String checkIn,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'prescription_items')
        required List<PrescriptionItem> prescriptionItems,
  }) = _Prescription;

  const Prescription._();

  factory Prescription.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionFromJson(json);
}
