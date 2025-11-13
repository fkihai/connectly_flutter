import 'package:connectly_flutter/features/auth/domain/entities/token_entity.dart';

abstract class AuthRepositories {
  Future<TokenEntity> login(String username, String password);
}
