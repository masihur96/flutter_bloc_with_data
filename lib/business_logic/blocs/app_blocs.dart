import 'package:bloc_flutter/business_logic/blocs/app_events.dart';
import 'package:bloc_flutter/business_logic/blocs/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository? _userRepository;
  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository!.getAllUser();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
