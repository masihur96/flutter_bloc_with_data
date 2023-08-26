import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/user_blocs/app_blocs.dart';
import '../../business_logic/user_blocs/app_events.dart';
import '../../business_logic/user_blocs/app_states.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';
import '../widgets/user_list_tile.dart';
import 'detail_screen.dart';

class HomPage extends StatelessWidget {
  const HomPage({Key? key, required this.title, required this.bgColor})
      : super(key: key);

  final String title;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The Bloc App'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: const Text(
                "2",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text(
                "3",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
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
