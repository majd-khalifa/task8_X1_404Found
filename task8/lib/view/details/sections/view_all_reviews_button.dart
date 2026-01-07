// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class ViewAllReviewsButton extends StatelessWidget {
  const ViewAllReviewsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Text(
            "View All Reviews",
            style: AppTextStyles.textStyle14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
