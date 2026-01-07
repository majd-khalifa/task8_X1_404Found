// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 64.w,
            height: 64.w,

            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary.withOpacity(0.5)),
              shape: BoxShape.circle,

              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withOpacity(.1),
                  AppColors.primary.withOpacity(.1),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 15.r,
                  offset: Offset(0, 0),
                ),
              ],
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

        Center(
          child: Text(
            'Create Account',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(height: 12.h),

        Center(
          child: Text(
            'Start tracking your watchlist and\n reviewing movies today.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
