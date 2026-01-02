import 'package:flutter/cupertino.dart';

import '../../../view/login/login_screen.dart';
import '../../../view/register/sign_up_screen.dart';



class AppRoute{
  static const login='/login';
  static const register='/register';
  static const home ='/home';
  static const movieDetailScreen ='/movieDetailScreen';
  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    register: (context) => SignUpScreen(),

  };
}