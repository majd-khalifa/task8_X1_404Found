import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/text_style.dart';

class ReviewsSubmit extends StatelessWidget {
  final TextEditingController controller;

  const ReviewsSubmit({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Review submitted (demo)')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              elevation: 12,
            ),
            child: Text(
              'Submit Review',
              style: AppTextStyles.textStyle18.copyWith(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        TextButton(
          onPressed: () => Navigator.pop(context),

          child: Text(
            'Discard Changes',
            style: AppTextStyles.textStyle14.copyWith(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
