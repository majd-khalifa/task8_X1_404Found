// app_colors.dart
import 'package:flutter/material.dart';

class AppColor {

  // ألوان الخلفية
  static const Color primaryBackground = Color(0xFF0A0A0A);
  static const Color secondaryBackground = Color(0xFF1A1A1A);
  static const Color cardBackground = Color(0xFF1E1E1E);
  static const Color inputBackground = Color(0xFF2D2D2D);


  // الألوان الأساسية
  static const Color primary = Color(0xFF7C4DFF);
  static const Color primaryVariant = Color(0xFF651FFF);
  static const Color secondary = Color(0xFF03DAC6);

  // النصوص
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textHint = Colors.white54;
  //gradient
  static const Color gradient1 = Color(0xFF1A0B2E);
  static const Color gradient2 = Color(0xFF0A0A0A);

  // Buttons
  static Color buttonDark = Colors.white.withOpacity(.1);
  static Color buttonDarkHover = Colors.white.withOpacity(.2);

  // الحدود والأيقونات
  static const Color border = Color(0xFF404040);
  static const Color iconColor = Color(0xFF9E9E9E);
  static Color borderLight = Colors.white.withOpacity(.1);
  static Color borderStrong = Colors.white.withOpacity(.2);

  // التدرج اللوني
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7C4DFF), Color(0xFF651FFF)],
  );

  static LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A0B2E), Color(0xFF0A0A0A)],
    stops: [0.0, 0.8],
  );
  static const Color facebookBlue = Color(0xFF1877F2);
}