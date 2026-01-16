import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_image.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/core/constants/constant.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmail = ConstantData.useremail;
    final username = userEmail.split("@").first; // استخراج الاسم من الإيميل

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Welcome text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back,",
                style: AppTextStyles.textStyle12.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              4.verticalSpace,
              Text(
                username.isNotEmpty ? username : "Discover",
                style: AppTextStyles.textStyle24.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Right side: Profile image
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderLight, width: 2),
            ),
            clipBehavior: Clip.antiAlias,
            child: CircleAvatar(backgroundImage: AssetImage(AppImage.majed)),
          ),
        ],
      ),
    );
  }
}
