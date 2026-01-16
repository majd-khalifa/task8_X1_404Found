import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class ReviewsSubmit extends StatelessWidget {
  final TextEditingController controller;
  final double rating;
  final int movieId;
  final VoidCallback onSubmit;
  final bool isLoading;
  const ReviewsSubmit({
    super.key,
    required this.controller,
    required this.rating,
    required this.movieId,
    required this.onSubmit,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: AppColors.white)
            : Text(
                'Submit Review',
                style: AppTextStyles.textStyle18.copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
