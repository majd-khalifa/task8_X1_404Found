import 'package:flutter/material.dart';
import 'package:task8/view/auth/login/login_screen.dart';
import 'package:task8/view/home/home_screen.dart';
import 'package:task8/view/trailer/trailer_page.dart';
import 'package:task8/view/reviews/reviews_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String trailer = '/trailer';
  static const String reviews = '/reviews';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case trailer:
        final args = settings.arguments as Map<String, dynamic>?;
        final movieId =
            args?['movieId'] as int? ?? 155; // Default to Interstellar
        return MaterialPageRoute(builder: (_) => TrailerPage(movieId: movieId));

      case reviews:
        return MaterialPageRoute(builder: (_) => const ReviewsPage());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
