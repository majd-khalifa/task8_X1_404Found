// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class AverageRating extends StatelessWidget {
  const AverageRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Average Rating", style: AppTextStyles.textStyle12),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("8.6", style: AppTextStyles.textStyle30),
            SizedBox(width: 8.w),
            Row(
              children: List.generate(5, (index) {
                double rating = 5;
        
                Color color;
                if (index < rating.floor()) {
                  color = AppColors.primary;
                } else if (index < rating && rating % 1 != 0) {
                  color = AppColors.primary.withOpacity(0.5);
                } else {
                  color = Colors.black;
                }
        
                return Icon(Icons.star, size: 20.sp, color: color);
              }),
            ),
          ],
        ),
      ],
    );
  }
}
