import 'package:bloc_flutter/business_logic/blocs/app_blocs.dart';
import 'package:bloc_flutter/data/repositories/user_repository.dart';
import 'package:bloc_flutter/presentation/router/app_router.dart';
import 'package:bloc_flutter/presentation/screens/Third_screen.dart';
import 'package:bloc_flutter/presentation/screens/home.dart';
import 'package:bloc_flutter/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      // routes: {
      //   '/': (context) => RepositoryProvider(
      //         create: (context) => UserRepository(),
      //         child: const Home(
      //           title: 'Home',
      //           bgColor: Colors.greenAccent,
      //         ),
      //       ),
      //   '/second': (context) => RepositoryProvider(
      //         create: (context) => UserRepository(),
      //         child: const SecondScreen(
      //           title: 'Second',
      //           bgColor: Colors.greenAccent,
      //         ),
      //       ),
      //   '/third': (context) => RepositoryProvider(
      //         create: (context) => UserRepository(),
      //         child: const SecondScreen(
      //           title: 'Third',
      //           bgColor: Colors.greenAccent,
      //         ),
      //       ),
      // },
      // home: RepositoryProvider(
      //     create: (context) => UserRepository(), child: const Home()),
    );
  }
}
