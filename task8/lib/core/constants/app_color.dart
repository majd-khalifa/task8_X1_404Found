// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF7F13EC);

  // Background
  static const Color backgroundLight = Color(0xFFF7F6F8);
  static const Color backgroundDark = Color(0xFF0D0A10);
  static const surfaceDark = Color(0xFF251B2F);

  // Text
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textMuted = Colors.white54;

  // Borders
  static Color borderLight = Colors.white.withAlpha((0.1 * 255).round());
  static Color borderStrong = Colors.white.withAlpha((0.2 * 255).round());

  // Cards
  static Color cardDark = Colors.white.withAlpha((0.05 * 255).round());

  // Ratings
  static const Color ratingStar = primary;
  static const Color rottenTomato = Colors.red;

  // Buttons
  static Color buttonDark = Colors.white.withAlpha((0.1 * 255).round());
  static Color buttonDarkHover = Colors.white.withAlpha((0.2 * 255).round());

  // Additional colors
  static const Color white = Colors.white;
  static const Color green = Colors.green;
  static const Color purple = Colors.purple;

  // Gradients
  static const List<Color> gradient1 = [primary, Colors.purple];
  static const List<Color> gradient2 = [Colors.blue, primary];

  // Profile backgrounds
  static Color greenprofilebackground = Colors.green.withOpacity(0.1);
  static Color purpleprofilebackground = Colors.purple.withOpacity(0.1);
}
