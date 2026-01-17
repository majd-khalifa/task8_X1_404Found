import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class ReviewsRating extends StatelessWidget {
  final double rating;
  final Function(double) onRate;

  const ReviewsRating({super.key, required this.rating, required this.onRate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'TAP TO RATE',
          style: AppTextStyles.textStyle12.copyWith(
            letterSpacing: 1.8,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 12.h),
        //star rating
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (i) {
            final idx = i + 1;
            return GestureDetector(
              onTap: () => onRate(idx.toDouble()),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Icon(
                  Icons.star,
                  size: 36.sp,
                  color: idx <= rating ? AppColors.primary : Colors.white24,
                ),
              ),
            );
          }),
        ),

        SizedBox(height: 8.h),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: rating.toStringAsFixed(1),
                style: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.primary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " / 5.0",
                style: AppTextStyles.textStyle16.copyWith(
                  color: Colors.white30,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
