import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/text_style.dart';

class GoToLogInSection extends StatelessWidget {
  const GoToLogInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: AppTextStyles.textStyle16.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
          child: Text(
            'Login',
            style: AppTextStyles.textStyle16.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
