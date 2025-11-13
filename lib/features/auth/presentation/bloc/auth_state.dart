import 'package:connectly_flutter/features/auth/domain/entities/token_entity.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final TokenEntity token;
  const LoginSuccess({required this.token});
  @override
  List<Object> get props => [token];
}

class LoginFailure extends AuthState {
  const LoginFailure(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
