// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class YourReviewHeaderRow extends StatelessWidget {
  const YourReviewHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                "You",
                style: AppTextStyles.textStyle14.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Review",
                  style: AppTextStyles.textStyle14.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.star, size: 14.sp, color: AppColors.primary),
                    Icon(Icons.star, size: 14.sp, color: AppColors.primary),
                    Icon(Icons.star, size: 14.sp, color: AppColors.primary),
                    Icon(Icons.star, size: 14.sp, color: AppColors.primary),
                    Icon(Icons.star, size: 14.sp, color: AppColors.primary),
                    SizedBox(width: 8.w),
                    Text(
                      "Oct 24, 2023",
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.5),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Icon(Icons.more_horiz, color: AppColors.cardDark),
      ],
    );
  }
}
