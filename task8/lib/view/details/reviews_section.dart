import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/view/details/widgets/review_card.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Reviews (12k)", style: AppTextStyles.textStyle18),
              Spacer(),
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary.withOpacity(0.2),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  shape: StadiumBorder(),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.rate_review,
                      size: 18.sp,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Post Review",
                      style: AppTextStyles.textStyle14.copyWith(color: AppColors.primary)
                      
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "You",
                            style:
                            AppTextStyles.textStyle14.copyWith(color: AppColors.primary)
                            
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Review",
                              style: AppTextStyles. textStyle14.copyWith(color: AppColors.white)
                            
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14.sp,
                                  color: AppColors.primary,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 14.sp,
                                  color: AppColors.primary,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 14.sp,
                                  color: AppColors.primary,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 14.sp,
                                  color: AppColors.primary,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 14.sp,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Oct 24, 2023",
                                  style: TextStyle(
                                    color: AppColors.white.withOpacity(0.5),
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_horiz, color: AppColors.cardDark),
                  ],
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          size: 16.sp,
                          color: AppColors.white.withOpacity(0.4),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "24",
                          style: TextStyle(
                            color: AppColors.white.withOpacity(0.4),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.borderLight,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                size: 14.sp,
                                color: AppColors.white,
                              ),
                              SizedBox(width: 4.w),
                              Text("Edit", style: AppTextStyles.textStyle12),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.rottenTomato.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                size: 14.sp,
                                color: Colors.red[400],
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "Delete",
                                style: AppTextStyles.textStyle12.copyWith(
                                  color: Colors.red[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Column(
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
          ),
          SizedBox(height: 20.h),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  "View All Reviews",
                  style: AppTextStyles.textStyle14.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
