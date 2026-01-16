// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/models/movie.dart';

class ReviewsPosterCard extends StatelessWidget {
  final Movie movie;

  const ReviewsPosterCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Container(
            width: 64.w,
            height: 96.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(movie.posterUrl),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: AppTextStyles.textStyle20.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "${movie.year} • ${movie.genreName}",
                  style: AppTextStyles.textStyle12.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
