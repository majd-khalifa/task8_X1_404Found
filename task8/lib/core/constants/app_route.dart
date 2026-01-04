import 'package:flutter/material.dart';
import 'package:task8/view/auth/login/login_screen.dart';
import 'package:task8/view/details/movie_detail_screen.dart';
import 'package:task8/view/home/home_screen.dart';
import 'package:task8/view/profile/profile_screen.dart';
import 'package:task8/view/reviews/reviews_page.dart';
import 'package:task8/view/trailer/trailer_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';

  static const String details = '/details';
  static const String trailer = '/trailer';
  static const String reviews = '/reviews';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case profile:
      //   return MaterialPageRoute(builder: (_) => const p());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case details:
        return MaterialPageRoute(builder: (_) => const MovieDetailsScreen());
      case trailer:
        return MaterialPageRoute(builder: (_) => const TrailerPage());
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
