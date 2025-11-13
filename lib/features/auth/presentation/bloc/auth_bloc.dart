import 'package:connectly_flutter/core/utils/secure_storage.dart';
import 'package:connectly_flutter/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:connectly_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:connectly_flutter/features/auth/domain/entities/token_entity.dart';
import 'package:connectly_flutter/features/auth/domain/usecase/login_usecase.dart';
import 'package:connectly_flutter/features/auth/presentation/bloc/auth_event.dart';
import 'package:connectly_flutter/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoginInitial()) {
    on<LoginButtonOnPressed>(_onPressed);
  }

  Future<void> _onPressed(
    LoginButtonOnPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 2));

    final AuthRemoteDatasource authRemoteDatasource = AuthRemoteDatasource();
    final AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl(
      authRemoteDatasource: authRemoteDatasource,
    );

    final LoginUsecase loginUsecase = LoginUsecase(
      repository: authRepositoryImpl,
    );

    try {
      final TokenEntity t = await loginUsecase.call(
        event.username,
        event.password,
      );

      await SecureStorage().save(key: 'token', value: t.token);

      final token = await SecureStorage().read(key: 'token');
      debugPrint("this token : $token");

      emit(LoginSuccess(token: t));
    } catch (e) {
      emit(LoginFailure("login failed"));
      debugPrint("error login: $e");
    }
  }
}
