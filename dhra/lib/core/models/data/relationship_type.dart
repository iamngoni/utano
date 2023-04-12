//
//  relationship_status
//  dhra
//
//  Created by Ngonidzashe Mangudya on 6/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'relationship_type.freezed.dart';
part 'relationship_type.g.dart';

@freezed
class RelationshipType with _$RelationshipType {
  factory RelationshipType({
    required String description,
    required String value,
  }) = _RelationshipType;

  factory RelationshipType.fromJson(Map<String, dynamic> json) =>
      _$RelationshipTypeFromJson(json);
}
