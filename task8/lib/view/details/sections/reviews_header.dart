// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class ReviewsHeader extends StatelessWidget {
  const ReviewsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Reviews (12k)", style: AppTextStyles.textStyle18),
        Spacer(),
        FilledButton.tonal(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary.withOpacity(0.2),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            shape: StadiumBorder(),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.rate_review, size: 18.sp, color: AppColors.primary),
              SizedBox(width: 8.w),
              Text(
                "Post Review",
                style: AppTextStyles.textStyle14.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
