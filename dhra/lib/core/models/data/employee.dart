//
//  employee
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dhra/core/models/data/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'health_institution.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  factory Employee({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required List<String> tags,
    required List<String> qualifications,
    @JsonKey(name: 'registered_on') required DateTime registeredOn,
    required User user,
    @JsonKey(name: 'registered_at') required HealthInstitution registeredAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'professional_title') String? professionalTitle,
    String? bio,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
