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
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'date_joined') required DateTime? dateJoined,
    @JsonKey(name: 'created_at') required DateTime? createdAt,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_verified') required bool isVerified,
    required String username,
    required UserRole role,
    @JsonKey(name: 'password_updated_at') required DateTime? passwordUpdatedAt,
    @JsonKey(name: 'receive_email_notifications')
        required bool receiveEmailNotifications,
    required String? gender,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
