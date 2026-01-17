import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/core/constants/app_color.dart';

class InfoTag extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoTag({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Icon(icon, size: 12.sp, color: AppColors.textSecondary),
          SizedBox(width: 4.w),
          Text(
            text,
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
