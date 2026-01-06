// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF7F13EC);
  //gradient
  static const Color backgroundGradientTop = Color.fromRGBO(0, 0, 0, 0.35);

  static const Color backgroundGradientMiddle = Color.fromRGBO(
    25,
    16,
    34,
    0.65,
  );
  static const Color gradient1 = Color(0xFF1A0B2E);
  static const Color gradient2 = Color(0xFF0A0A0A);

  static const Color backgroundGradientBottom = Color(0xFF191022);
  // Background
  static const Color backgroundLight = Color(0xFFF7F6F8);
  static const Color backgroundDark = Color(0xFF0D0A10);
  static const Color primaryBackground = Color(0xFF0A0A0A);
  static const Color inputBackground = Color(0xFF2D2D2D);
  static const Color cardBackground = Color(0xFF1E1E1E);

  static const Color background = Color(0xFF191022);
  static final Color greenprofilebackground = Colors.green[400]!;
  static final Color purpleprofilebackground = Colors.purple[400]!;
  static final Color blueprofilebackground = Colors.blue[400]!;
  static const surfaceDark = Color(0xFF251B2F);

  // Text
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textMuted = Colors.white54;

  // Borders
  static const Color border = Color(0xFF404040);
  static const Color iconColor = Color(0xFF9E9E9E);
  static Color borderLight = Colors.white.withOpacity(.1);
  static Color borderStrong = Colors.white.withOpacity(.2);

  // Cards
  static Color cardDark = Colors.white.withOpacity(.05);

  // Ratings
  static const Color ratingStar = primary;
  static const Color rottenTomato = Colors.red;

  // Buttons
  static Color buttonDark = Colors.white.withOpacity(.1);
  static Color buttonDarkHover = Colors.white.withOpacity(.2);
  //colors
  static const white = Colors.white;
  static const green = Colors.green;
  static const purple = Colors.purple;
  static const blue = Colors.blue;

  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7C4DFF), Color(0xFF651FFF)],
  );
  static const Color facebookBlue = Color(0xFF1877F2);
}
