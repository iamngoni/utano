//
//  dispense
//  dhra
//
//  Created by Ngonidzashe Mangudya on 1/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import 'dispense_item.dart';
import 'payment.dart';

part 'dispense.freezed.dart';
part 'dispense.g.dart';

@freezed
class Dispense with _$Dispense {
  const factory Dispense({
    required String id,
    required String prescription,
    required Payment? payment,
    required List<DispenseItem> items,
    @JsonKey(name: 'total_cost') required double totalCost,
    @JsonKey(name: 'total_rtgs_cost') required double totalRtgsCost,
  }) = _Dispense;

  const Dispense._();

  factory Dispense.fromJson(Map<String, dynamic> json) =>
      _$DispenseFromJson(json);
}
