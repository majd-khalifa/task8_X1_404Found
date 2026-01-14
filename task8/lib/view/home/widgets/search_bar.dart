import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/text_style.dart';

class AppSearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(Map)? onFilter;

  const AppSearchBar({super.key, this.onChanged, this.onFilter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderLight),
        ),
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColors.textMuted, size: 22.sp),
            10.horizontalSpace,

            Expanded(
              child: TextField(
                onChanged: onChanged,
                style: AppTextStyles.textStyle14,
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                  hintText: "Search movies, actors...",
                  hintStyle: AppTextStyles.textStyle14.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ),

            // زر الفلتر
            IconButton(
              icon: Icon(Icons.tune, color: AppColors.textMuted, size: 22.sp),
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                  AppRoutes.filter,
                );

                if (result != null && onFilter != null) {
                  onFilter!(result as Map);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
