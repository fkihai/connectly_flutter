import 'package:connectly_flutter/features/auth/domain/entities/token_entity.dart';
import 'package:connectly_flutter/features/auth/domain/repositories/auth_repositories.dart';

class LoginUsecase {
  final AuthRepositories repository;
  LoginUsecase({required this.repository});
  Future<TokenEntity> call(String username, String password) async {
    return await repository.login(username, password);
  }
}
