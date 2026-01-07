// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/view/details/widgets/review_card.dart';

class OtherReviewsList extends StatelessWidget {
  const OtherReviewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewCard(
          initials: "JD",
          avatarBg: AppColors.green.withOpacity(0.2),
          avatarTextColor: AppColors.blueprofilebackground,
          name: "John Doe",
          rating: 4,
          dateText: "2 days ago",
          reviewText:
              "Christopher Nolan does it again. The docking scene is perhaps the most tense sequence in cinema history.",
        ),
        SizedBox(height: 12.h),
        ReviewCard(
          initials: "SA",
          avatarBg: AppColors.green.withOpacity(0.2),
          avatarTextColor: AppColors.greenprofilebackground,
          name: "Sarah A.",
          rating: 5,
          dateText: "1 week ago",
          reviewText:
              "Beautiful, haunting, and scientifically fascinating. It's a bit long, but worth every minute.",
        ),
        SizedBox(height: 12.h),
        ReviewCard(
          initials: "MK",
          avatarBg: AppColors.purple.withOpacity(0.2),
          avatarTextColor: AppColors.purpleprofilebackground,
          name: "Mike K.",
          rating: 3,
          dateText: "2 weeks ago",
          reviewText:
              "I didn't quite understand the ending, but the journey there was incredible.",
        ),
      ],
    );
  }
}
