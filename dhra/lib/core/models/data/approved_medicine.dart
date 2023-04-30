//
//  approved_medicine
//  dhra
//
//  Created by Ngonidzashe Mangudya on 22/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import 'model.dart';

part 'approved_medicine.freezed.dart';
part 'approved_medicine.g.dart';

@freezed
class ApprovedMedicine with _$ApprovedMedicine implements Model {
  const factory ApprovedMedicine({
    required String id,
    required String name,
    required String description,
  }) = _ApprovedMedicine;

  const ApprovedMedicine._();

  factory ApprovedMedicine.fromJson(Map<String, dynamic> json) =>
      _$ApprovedMedicineFromJson(json);
}
