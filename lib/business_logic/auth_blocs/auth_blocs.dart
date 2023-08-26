import 'package:bloc_flutter/business_logic/auth_blocs/auth_events.dart';
import 'package:bloc_flutter/business_logic/auth_blocs/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository? _authRepository;
  AuthBloc(this._authRepository) : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final users = await _authRepository!.login("user", "password");
        emit(const AuthSuccessfulState('Successfully Logged In'));
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });
  }
}
