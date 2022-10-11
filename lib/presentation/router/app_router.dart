import 'dart:js';

import 'package:bloc_flutter/business_logic/blocs/app_blocs.dart';
import 'package:bloc_flutter/presentation/screens/Third_screen.dart';
import 'package:bloc_flutter/presentation/screens/home.dart';
import 'package:bloc_flutter/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/blocs/app_events.dart';
import '../../data/repositories/user_repository.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => UserRepository(),
            child: const Home(
              title: 'Home',
              bgColor: Colors.greenAccent,
            ),
          ),
        );

        break;
      case '/second':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => UserRepository(),
            child: const SecondScreen(
              title: 'Second',
              bgColor: Colors.greenAccent,
            ),
          ),
        );
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => UserRepository(),
            child: const ThirdScreen(
              title: 'Third',
              bgColor: Colors.greenAccent,
            ),
          ),
        );
        break;
      default:
        return null;
    }
  }
}
