//
//  user
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_role.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    @JsonKey(name: 'last_login') required DateTime? lastLogin,
    @JsonKey(name: 'is_superuser') required bool isSuperuser,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'is_staff') required bool isStaff,
    @JsonKey(name: 'date_joined') required String dateJoined,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_verified') required bool isVerified,
    required String username,
    required UserRole role,
    @JsonKey(name: 'password_updated_at') required String passwordUpdatedAt,
    @JsonKey(name: 'receive_email_notifications')
        required bool receiveEmailNotifications,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
