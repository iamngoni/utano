//
//  prescription_item
//  dhra
//
//  Created by Ngonidzashe Mangudya on 25/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_item.freezed.dart';
part 'prescription_item.g.dart';

@freezed
class PrescriptionItem with _$PrescriptionItem {
  const factory PrescriptionItem({
    required int frequency,
    required String id,
    required String instructions,
    required String medicine,
    @JsonKey(name: 'medicine_id') required String medicineId,
    required String prescription,
    required int quantity,
  }) = _PrescriptionItem;

  const PrescriptionItem._();

  factory PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionItemFromJson(json);
}
