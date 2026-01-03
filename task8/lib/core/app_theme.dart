import 'package:flutter/material.dart';
import 'constants/app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      // أضف المزيد من الإعدادات حسب الحاجة
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      // أضف المزيد من الإعدادات حسب الحاجة
    );
  }
}
