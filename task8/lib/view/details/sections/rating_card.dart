// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/view/details/sections/average_rating.dart';
import 'package:task8/view/details/sections/rotten_tomatoes.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.cardDark, width: 1.w),
      ),
      child: Row(
        children: [
          AverageRating(),
    
          SizedBox(width: 16.w),
          Container(
            height: 40.h,
            width: 1.w,
            color: Colors.white.withOpacity(0.1),
          ),
          SizedBox(width: 16.w),
    
          Expanded(
            child: RottenTomatoes(),
          ),
        ],
      ),
    );
  }
}
