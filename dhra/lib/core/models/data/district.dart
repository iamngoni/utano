//
//  district
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import 'province.dart';

part 'district.freezed.dart';
part 'district.g.dart';

@freezed
class District with _$District {
  factory District({
    required String id,
    required String name,
    Province? province,
  }) = _District;

  const District._();

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  @override
  String toString() => name;
}
