class UserEntity {
  final String id;
  final String tenantId;
  final String email;
  final String role;
  final bool isActive;

  UserEntity({
    required this.id,
    required this.tenantId,
    required this.email,
    required this.role,
    required this.isActive,
  });
}
