import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccessfulState extends AuthState {
  final String username;

  const AuthSuccessfulState(this.username);

  @override
  List<Object?> get props => [username];
}

class AuthErrorState extends AuthState {
  final String error;

  const AuthErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
