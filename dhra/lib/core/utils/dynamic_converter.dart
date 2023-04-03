//
//  dynamic_converter
//  dhra
//
//  Created by Ngonidzashe Mangudya on 4/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/data/district.dart';

class DynamicConverter extends JsonConverter<dynamic, Object?> {
  const DynamicConverter();

  @override
  dynamic fromJson(Object? json) {
    if (json is Map<String, dynamic>) return District.fromJson(json);
    if (json is String) return json;

    throw StateError('');
  }

  static dynamic staticFromJson(Object? json) {
    return const DynamicConverter().fromJson(json);
  }

  @override
  Object? toJson(Object? object) {
    if (object is District) return object.toJson();
    if (object is String) return object;

    throw StateError('');
  }

  static Object? staticToJson(DateTime object) {
    return const DynamicConverter().toJson(object);
  }
}
