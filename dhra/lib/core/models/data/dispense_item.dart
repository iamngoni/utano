//
//  dispense_item
//  dhra
//
//  Created by Ngonidzashe Mangudya on 1/5/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispense_item.freezed.dart';
part 'dispense_item.g.dart';

@freezed
class DispenseItem with _$DispenseItem {
  const factory DispenseItem({
    required String drug,
    required int quantity,
  }) = _DispenseItem;

  const DispenseItem._();

  factory DispenseItem.fromJson(Map<String, dynamic> json) =>
      _$DispenseItemFromJson(json);
}
