import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class LoginButtonOnPressed extends AuthEvent {
  final String username;
  final String password;

  const LoginButtonOnPressed(this.username, this.password);
}

class CheckAunthenticated extends AuthEvent {}

class Testauth extends AuthEvent {}
