import 'package:connectly_flutter/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.tenantId,
    required super.email,
    required super.role,
    required super.isActive,
  });

  factory UserModel.fromsJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      tenantId: json['tenant_id'],
      email: json['email'],
      role: json['email'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenant_id': tenantId,
      'email': email,
      'role': role,
      'is_active': isActive,
    };
  }
}
