import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: AppColors.borderLight),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          children: [
            const Icon(Icons.search, color: AppColors.textMuted, size: 22.0),
            const SizedBox(width: 10.0),
            Expanded(
              child: TextField(
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
            const Icon(Icons.tune, color: AppColors.textMuted, size: 22.0),
          ],
        ),
      ),
    );
  }
}
