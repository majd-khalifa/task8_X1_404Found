// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.initials,
    required this.avatarBg,
    required this.avatarTextColor,
    required this.name,
    required this.rating,
    required this.dateText,
    required this.reviewText,
  });

  final String initials;
  final Color avatarBg;
  final Color avatarTextColor;
  final String name;
  final int rating;
  final String dateText;
  final String reviewText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.05), width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: avatarBg,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      initials,
                      style: TextStyle(
                        color: avatarTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: AppTextStyles.textStyle14),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              final filled = index < rating;
                              return Icon(
                                Icons.star,
                                size: 12.sp,
                                color: filled
                                    ? AppColors.primary
                                    : AppColors.borderStrong,
                              );
                            }),
                          ),
                          const SizedBox(width: 8),
                          Text(dateText, style: AppTextStyles.textStyle10),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(reviewText, style: AppTextStyles.textStyle14),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
