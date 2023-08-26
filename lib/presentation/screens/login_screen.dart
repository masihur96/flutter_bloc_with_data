import 'package:bloc_flutter/business_logic/auth_blocs/auth_blocs.dart';
import 'package:bloc_flutter/business_logic/auth_blocs/auth_events.dart';
import 'package:bloc_flutter/business_logic/auth_blocs/auth_states.dart';
import 'package:bloc_flutter/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        RepositoryProvider.of<AuthRepository>(context),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuthErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state is AuthSuccessfulState) {
              return Center(child: Text('Logged in as ${state.username}'));
            } else {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    final AuthBloc authenticationBloc =
                        BlocProvider.of<AuthBloc>(context);
                    authenticationBloc.add(const LoginEvent(
                        username: 'user', password: 'password'));
                  },
                  child: const Text('Login'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
