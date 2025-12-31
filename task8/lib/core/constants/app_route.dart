import 'package:flutter/material.dart';
import 'package:task8/view/auth/login/login_screen.dart';
import 'package:task8/view/home/home_screen.dart';
import 'package:task8/view/details/details_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String details = '/details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case details:
        return MaterialPageRoute(builder: (_) => const MovieDetailsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
