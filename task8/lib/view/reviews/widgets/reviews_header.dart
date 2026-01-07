import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/text_style.dart';

class ReviewsHeader extends StatelessWidget {
  const ReviewsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white70),
          label: Text(
            'Cancel',
            style: AppTextStyles.textStyle18.copyWith(color: Colors.white70),
          ),
        ),
        Text(
          'Write Review',
          style: AppTextStyles.textStyle20.copyWith(color: Colors.white),
        ),
        SizedBox(width: 56.w),
      ],
    );
  }
}
