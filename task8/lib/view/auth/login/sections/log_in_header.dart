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
        Stack(
          children: [
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Image.asset(
                'assets/images/poor_thing.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 64.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(18.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.6),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.movie_filter_sharp,
                    color: Colors.white,
                    size: 30.w,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Center(
          child: Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ),

        const SizedBox(height: 8),


        SizedBox(height: 20.h),

        Center(child: Text('Welcome Back', style: AppTextStyles.textStyle28)),

        SizedBox(height: 8.h),

        Center(
          child: Text(
            'Log in to track and rate the latest premieres.',
            textAlign: TextAlign.center,

             style: AppTextStyles.textStyle14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 32),

          
          ]);
      

       
    
  }
}
