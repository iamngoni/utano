//
//  drug
//  dhra
//
//  Created by Ngonidzashe Mangudya on 21/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/data/model.dart';

part 'drug.freezed.dart';
part 'drug.g.dart';

@freezed
class Drug with _$Drug implements Model {
  const factory Drug({
    required String id,
    required String name,
    required String description,
    required double price,
    required int quantity,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _Drug;

  factory Drug.fromJson(Map<String, dynamic> json) => _$DrugFromJson(json);
}
