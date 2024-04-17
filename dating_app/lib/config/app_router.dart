import 'package:flutter/material.dart';

class Approuter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      /*
      case '/':
        return HomeScreen.route();
      */
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
