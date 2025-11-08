import 'package:connectly_flutter/features/auth/presentation/bloc/auth_event.dart';
import 'package:connectly_flutter/features/auth/presentation/bloc/auth_state.dart';
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
    if (event.username == "admin") {
      if (event.password == "909090") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("password not match"));
      }
    } else {
      emit(LoginFailure("usernama is wrong"));
    }
  }
}
