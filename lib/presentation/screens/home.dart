import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/blocs/app_blocs.dart';
import '../../business_logic/blocs/app_events.dart';
import '../../business_logic/blocs/app_states.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';
import '../widgets/user_list_tile.dart';
import 'detail_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The Bloc App'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel?> userList = state.users;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => DetailScreen(e: userList[index]!)));
                      },
                      child: UserListTile(
                        firstName: userList[index]!.firstName,
                        lastName: userList[index]!.lastName,
                        avatar: userList[index]!.avatar,
                      ));
                },
              );
            }
            if (state is UserErrorState) {
              return const Center(
                child: Text("err"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
