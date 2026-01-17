// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/models/movie_model.dart';
import 'package:task8/view/details/widgets/info_tag.dart';

class BuildMovieInfo extends StatelessWidget {
  const BuildMovieInfo({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderStrong),
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.cardDark,
            ),
            child: Text(
              movie.ageRating,
              style: AppTextStyles.textStyle10.copyWith(
                color: AppColors.textPrimary.withOpacity(0.9),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          InfoTag(icon: Icons.calendar_month, text: movie.year.toString()),
          SizedBox(width: 15.w),
          InfoTag(
            icon: Icons.schedule,
            text: "${movie.duration ~/ 60}h ${movie.duration % 60}m",
          ),
          SizedBox(width: 15.w),
          InfoTag(icon: Icons.translate, text: movie.language),
        ],
      ),
    );
  }
}
