import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';
import 'app_font.dart';

class AppTextStyles {
  /// 10.sp — badges, tiny labels
  static TextStyle textStyle10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 14 / 10,
  );

  /// 12.sp — small labels, cast names, timestamps
  static TextStyle textStyle12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textSecondary,
    height: 16 / 12,
  );

  /// 14.sp — body text, review text, genres
  static TextStyle textStyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 20 / 14,
  );

  /// 16.sp — normal body, grid titles
  static TextStyle textStyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 22 / 16,
  );

  /// 18.sp — section titles (Synopsis, Reviews, Cast)
  static TextStyle textStyle18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 24 / 18,
  );

  /// 20.sp — Trending Now title
  static TextStyle textStyle20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 26 / 20,
  );

  /// 24.sp — big titles (Profile name, section headers)
  static TextStyle textStyle24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 30 / 24,
  );

  /// 28.sp — large display text (rare)
  static TextStyle textStyle28 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 34 / 28,
  );

  /// 30.sp — Movie Title (Interstellar)
  static TextStyle textStyle30 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w900,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 36 / 30,
  );

  /// 32.sp — Hero titles (rare)
  static TextStyle textStyle32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    fontFamily: AppFont.beVietnamPro,
    color: AppColors.textPrimary,
    height: 38 / 32,
  );
}
