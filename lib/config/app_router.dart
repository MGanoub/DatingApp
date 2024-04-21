import 'package:dating_app/screens/home/home_screen.dart';
import 'package:dating_app/screens/screens.dart';
import 'package:dating_app/screens/users/user_screen.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class Approuter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case UsersScreen.routeName:
        return UsersScreen.route(user: settings.arguments as User);
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      case MatchesScreen.routeName:
        return MatchesScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text("error"))),
      settings: RouteSettings(name: "/error"),
    );
  }
}
