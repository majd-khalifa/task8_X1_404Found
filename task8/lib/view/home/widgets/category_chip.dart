// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/size_app.dart';
import 'package:task8/core/constants/text_style.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isActive;

  const CategoryChip({super.key, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.buttonDark,
        borderRadius: BorderRadius.circular(999.r),
        border: Border.all(
          color: isActive ? Colors.transparent : AppColors.borderLight,
        ),
        boxShadow: isActive
            ? [
                AppShadows.primaryShadow.copyWith(
                  color: AppShadows.primaryShadow.color.withOpacity(.7),
                  offset: const Offset(0, 6),
                  blurRadius: 8,
                ),
              ]
            : [],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: AppTextStyles.textStyle12.copyWith(
          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          color: isActive ? Colors.white : AppColors.textSecondary,
        ),
      ),
    );
  }
}
