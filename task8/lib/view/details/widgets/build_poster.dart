import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/models/movie.dart';

class BuildPoster extends StatelessWidget {
  const BuildPoster({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176.w,
      height: 256.h,
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          movie.posterUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.black12,
            alignment: Alignment.center,
            child: const Icon(Icons.error, color: Colors.white70, size: 50),
          ),
        ),
      ),
    );
  }
}
