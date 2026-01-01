// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/size_app.dart';
import 'package:task8/core/constants/text_style.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 24.h,
        top: 12.h,
        left: 24.w,
        right: 24.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(.95),
        border: Border(top: BorderSide(color: AppColors.borderLight)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _NavItem(icon: Icons.home_filled, label: "Home", isActive: true),
          _NavItem(icon: Icons.search, label: "Search"),
          _CenterNavButton(),
          _NavItem(icon: Icons.reviews, label: "Reviews"),
          _NavItem(icon: Icons.person, label: "Profile"),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _NavItem({
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : AppColors.textMuted;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 26.sp, color: color),
        2.verticalSpace,
        Text(label, style: AppTextStyles.textStyle10.copyWith(color: color)),
      ],
    );
  }
}

class _CenterNavButton extends StatelessWidget {
  const _CenterNavButton();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -14.h), // رقم سالب = لفوق
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.backgroundDark, width: 4.w),
          boxShadow: [AppShadows.primaryShadow],
        ),
        child: Icon(Icons.add, color: Colors.white, size: 28.sp),
      ),
    );
  }
}
