// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/view/details/sections/other_reviews_list.dart';
import 'package:task8/view/details/sections/reviews_header.dart';
import 'package:task8/view/details/sections/view_all_reviews_button.dart';
import 'package:task8/view/details/sections/your_review_footer_actions.dart';
import 'package:task8/view/details/sections/your_review_header_row.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewsHeader(),
          SizedBox(height: 12),
          YourReviewCard(),
          SizedBox(height: 16.h),
          OtherReviewsList(),
          SizedBox(height: 20.h),
          const ViewAllReviewsButton(),
        ],
      ),
    );
  }
}

class YourReviewCard extends StatelessWidget {
  const YourReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YourReviewHeaderRow(),
          SizedBox(height: 12.h),
          Text(
            "Absolutely mind-blowing visuals and a soundtrack that stays with you for days. "
            "While the physics can be dense, the emotional core of the father-daughter relationship "
            "grounds it perfectly. A masterpiece.",
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 14.sp,
              height: 1.6,
            ),
          ),
          SizedBox(height: 12.h),
          YourReviewFooterActions(),
        ],
      ),
    );
  }
}
