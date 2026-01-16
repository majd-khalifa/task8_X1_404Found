import 'package:flutter/material.dart';
import 'package:task8/view/auth/login/login_screen.dart';
import 'package:task8/view/auth/register/register_screen.dart';
import 'package:task8/view/details/movie_detail_screen.dart';
import 'package:task8/view/filter/filter_screen.dart';
import 'package:task8/view/home/home_screen.dart';
import 'package:task8/view/profile/profile_screen.dart';
import 'package:task8/view/reviews/reviews_page.dart';
import 'package:task8/view/splash/splash_screen.dart';
import 'package:task8/view/trailer/trailer_page.dart';

class AppRoutes {
  static const String login = '/login';

  static const String signUp = '/signUp';

  static const String register = '/register';

  static const String home = '/home';
  static const String profile = '/profile';
  static const String splash = '/splash';

  static const String details = '/details';
  static const String trailer = '/trailer';
  static const String reviews = '/reviews';
  static const String filter = '/filter';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case details:
        final args = settings.arguments;
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => MovieDetailsScreen(movieId: args),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text("Movie ID not provided")),
            ),
          );
        }

      case trailer:
        final args = settings.arguments;
        if (args is Map && args.containsKey('movieId')) {
          return MaterialPageRoute(
            builder: (_) => TrailerPage(
              movieId: args['movieId'] as int,
              title: args['title'] as String?,
              posterUrl: args['posterUrl'] as String?,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Movie data is required')),
          ),
        );
      case reviews:
        final args = settings.arguments as Map<String, dynamic>?;

        if (args == null || !args.containsKey('movieId')) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text("movieId is required")),
            ),
          );
        }

        return MaterialPageRoute(
          builder: (_) =>
              ReviewsPage(movieId: args['movieId'], review: args['review']),
        );

      case filter:
        return MaterialPageRoute(builder: (_) => FilterScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
