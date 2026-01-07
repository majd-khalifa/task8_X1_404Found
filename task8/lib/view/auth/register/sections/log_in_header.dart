// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withOpacity(.25),
                  AppColors.primary.withOpacity(.05),
                ],
                radius: 0.85,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(.3),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
              border: Border.all(
                color: AppColors.primary.withOpacity(0.5),
                width: 1.5,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.movie_filter_sharp,
                color: AppColors.primary,
                size: 40.w,
              ),
            ),
          ),
        ),

        SizedBox(height: 24.h),

        /// Title
        Center(
          child: Text(
            'Create Account',
            style: AppTextStyles.textStyle32.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),

        SizedBox(height: 12.h),

        /// Subtitle
        Center(
          child: Text(
            'Start tracking your watchlist and\n reviewing movies today.',
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle16.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
