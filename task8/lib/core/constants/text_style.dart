import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';
import 'app_font.dart';

class AppTextStyles {
  /// 10.sp — badges, tiny labels
  static TextStyle textStyle10 = const TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w600,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 14 / 10,
  );

  /// 12.sp — small labels, cast names, timestamps
  static TextStyle textStyle12 = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textSecondary,
    height: 16 / 12,
  );

  /// 14.sp — body text, review text, genres
  static TextStyle textStyle14 = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 20 / 14,
  );

  /// 16.sp — normal body, grid titles
  static TextStyle textStyle16 = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 22 / 16,
  );

  /// 18.sp — section titles (Synopsis, Reviews, Cast)
  static TextStyle textStyle18 = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 24 / 18,
  );

  /// 20.sp — Trending Now title
  static TextStyle textStyle20 = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 26 / 20,
  );

  /// 24.sp — big titles (Profile name, section headers)
  static TextStyle textStyle24 = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 30 / 24,
  );

  /// 28.sp — large display text (rare)
  static TextStyle textStyle28 = const TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 34 / 28,
  );

  /// 30.sp — Movie Title (Interstellar)
  static TextStyle textStyle30 = const TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w900,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 36 / 30,
  );

  /// 32.sp — Hero titles (rare)
  static TextStyle textStyle32 = const TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w800,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 38 / 32,
  );
}
