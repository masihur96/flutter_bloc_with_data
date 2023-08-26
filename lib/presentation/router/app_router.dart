import 'package:bloc_flutter/presentation/screens/Third_screen.dart';
import 'package:bloc_flutter/presentation/screens/home.dart';
import 'package:bloc_flutter/presentation/screens/login_screen.dart';
import 'package:bloc_flutter/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomPage(
            title: 'Home',
            bgColor: Colors.greenAccent,
          ),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'Second',
            bgColor: Colors.redAccent,
          ),
        );

      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'Third',
            bgColor: Colors.greenAccent,
          ),
        );

      default:
        return null;
    }
  }
}
