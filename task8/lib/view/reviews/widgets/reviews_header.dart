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
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          label: const Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
        Text(
          'Write Review',
          style: AppTextStyles.textStyle24.copyWith(color: Colors.white),
        ),
        SizedBox(width: 56.w),
      ],
    );
  }
}
