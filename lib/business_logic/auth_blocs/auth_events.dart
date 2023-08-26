import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialEvent extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;
  const LoginEvent({required this.username, required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogoutEvent extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
