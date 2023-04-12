//
//  gender
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender.freezed.dart';
part 'gender.g.dart';

@freezed
class Gender with _$Gender {
  factory Gender({
    required String value,
    required String description,
  }) = _Gender;

  const Gender._();

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);

  @override
  String toString() => value;
}
