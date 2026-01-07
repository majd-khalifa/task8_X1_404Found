// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/size_app.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/core/constants/app_route.dart';

class BottomNav extends StatefulWidget {
  final int initialIndex;
  const BottomNav({super.key, required this.initialIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int activeIndex;

  @override
  void initState() {
    super.initState();
    activeIndex = widget.initialIndex; // ← أهم سطر
  }

  void _onTap(int index, String route) {
    Navigator.pushReplacementNamed(context, route);
  }

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
        children: [
          GestureDetector(
            onTap: () => _onTap(0, AppRoutes.home),
            child: _NavItem(
              icon: Icons.home_filled,
              label: "Home",
              isActive: activeIndex == 0,
            ),
          ),

          GestureDetector(
            onTap: () => _onTap(1, AppRoutes.home),
            child: _NavItem(
              icon: Icons.search,
              label: "Search",
              isActive: activeIndex == 1,
            ),
          ),

          const _CenterNavButton(),

          GestureDetector(
            onTap: () => _onTap(2, AppRoutes.reviews),
            child: _NavItem(
              icon: Icons.reviews,
              label: "Reviews",
              isActive: activeIndex == 2,
            ),
          ),

          GestureDetector(
            onTap: () => _onTap(3, AppRoutes.profile),
            child: _NavItem(
              icon: Icons.person,
              label: "Profile",
              isActive: activeIndex == 3,
            ),
          ),
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.trailer);
      },
      child: Transform.translate(
        offset: Offset(0, -14.h),
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
      ),
    );
  }
}
