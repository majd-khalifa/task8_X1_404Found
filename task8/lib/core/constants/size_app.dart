// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'app_color.dart';

class AppShadows {
  static BoxShadow primaryShadow = BoxShadow(
    color: AppColors.primary.withOpacity(.4),
    blurRadius: 12,
    offset: Offset(0, 6),
  );
}
