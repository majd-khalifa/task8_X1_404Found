import 'package:flutter/material.dart';
import 'package:task8/view/auth/login/login_screen.dart';
import 'package:task8/view/details/movie_detail_screen.dart';

import 'package:task8/view/home/home_screen.dart';
import 'package:task8/view/details/details_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
<<<<<<< HEAD
  static const String profile = '/profile';
=======
  static const String details = '/details';
>>>>>>> f868a9ea667c193ac5c8aebda07aa90cee954c45

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case profile:
        return MaterialPageRoute(builder: (_) => const MovieDetailsScreen());
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
