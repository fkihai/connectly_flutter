import 'package:connectly_flutter/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:connectly_flutter/features/auth/data/model/token_model.dart';
import 'package:connectly_flutter/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl extends AuthRepositories {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<TokenModel> login(String username, String password) async {
    final response = await authRemoteDatasource.login(username, password);
    return TokenModel.fromJson(response);
  }
}
