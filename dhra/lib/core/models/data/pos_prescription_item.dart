//
//  pos_prescription_item
//  dhra
//
//  Created by Ngonidzashe Mangudya on 22/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import 'approved_medicine.dart';

part 'pos_prescription_item.freezed.dart';
part 'pos_prescription_item.g.dart';

@freezed
class PosPrescriptionItem with _$PosPrescriptionItem {
  const factory PosPrescriptionItem({
    required ApprovedMedicine medicine,
    required int count,
  }) = _PosPrescriptionItem;

  const PosPrescriptionItem._();

  factory PosPrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PosPrescriptionItemFromJson(json);
}
