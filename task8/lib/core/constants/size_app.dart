// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'app_color.dart';

class AppShadows {
  static BoxShadow primaryShadow = BoxShadow(
    color: AppColors.primary.withAlpha((0.4 * 255).round()),
    blurRadius: 12,
    offset: const Offset(0, 6),
  );
}
