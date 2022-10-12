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
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
