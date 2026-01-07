// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class YourReviewFooterActions extends StatelessWidget {
  const YourReviewFooterActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.thumb_up,
              size: 16.sp,
              color: AppColors.white.withOpacity(0.4),
            ),
            SizedBox(width: 4.w),
            Text(
              "24",
              style: TextStyle(
                color: AppColors.white.withOpacity(0.4),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.borderLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.edit, size: 14.sp, color: AppColors.white),
                  SizedBox(width: 4.w),
                  Text("Edit", style: AppTextStyles.textStyle12),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.rottenTomato.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.delete, size: 14.sp, color: Colors.red[400]),
                  SizedBox(width: 4.w),
                  Text(
                    "Delete",
                    style: AppTextStyles.textStyle12.copyWith(
                      color: Colors.red[400],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
