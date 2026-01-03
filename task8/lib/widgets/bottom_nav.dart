// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/size_app.dart';
import 'package:task8/core/constants/text_style.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 24.0,
        top: 12.0,
        left: 24.0,
        right: 24.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withAlpha((0.95 * 255).round()),
        border: Border(top: BorderSide(color: AppColors.borderLight)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(
            icon: Icons.home_filled,
            label: "Home",
            isActive: true,
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.home);
            },
          ),
          const _NavItem(icon: Icons.search, label: "Search"),
          const _CenterNavButton(),
          _NavItem(
            icon: Icons.reviews,
            label: "Reviews",
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.reviews);
            },
          ),
          _NavItem(
            icon: Icons.video_library,
            label: "Trailer",
            onTap: () {
              Navigator.of(
                context,
              ).pushNamed(AppRoutes.trailer, arguments: {'movieId': 155});
            },
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
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : AppColors.textMuted;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 26.0, color: color),
          const SizedBox(height: 2.0),
          Text(label, style: AppTextStyles.textStyle10.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _CenterNavButton extends StatelessWidget {
  const _CenterNavButton();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -14.0), // رقم سالب = لفوق
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.backgroundDark, width: 4.0),
          boxShadow: [AppShadows.primaryShadow],
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.trailer),
          customBorder: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 28.0),
        ),
      ),
    );
  }
}
