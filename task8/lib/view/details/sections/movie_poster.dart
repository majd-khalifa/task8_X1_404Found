import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_image.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176.w,
      height: 256.h,
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight, width: 2),
        image: DecorationImage(
          image: AssetImage(AppImage.posterImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
