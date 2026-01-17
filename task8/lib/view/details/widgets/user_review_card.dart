// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/models/movie_model.dart';
import 'package:task8/models/review_model.dart';
import 'package:task8/view/details/cubit/detais_cubit.dart';

class UserReviewCard extends StatelessWidget {
  final Review review;
  final Movie movie;
  final int movieId;

  const UserReviewCard({
    super.key,
    required this.review,
    required this.movie,
    required this.movieId,
  });

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
          /// ===== HEADER =====
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
                      style: AppTextStyles.textStyle14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Review",
                        style: AppTextStyles.textStyle14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: List.generate(5, (index) {
                          final filled = index < review.rating;
                          final isUnderFive = review.rating < 5;
                          return Icon(
                            Icons.star,
                            size: 14.sp,
                            color: filled
                                ? (isUnderFive
                                      ? AppColors.primary
                                      : AppColors.background)
                                : AppColors.borderStrong,
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.more_horiz, color: AppColors.cardDark),
            ],
          ),

          SizedBox(height: 12.h),

          /// ===== COMMENT =====
          Text(
            review.comment,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 14.sp,
              height: 1.6,
            ),
          ),

          SizedBox(height: 12.h),
          Divider(color: Colors.white.withOpacity(0.08), thickness: 1),
          SizedBox(height: 12.h),

          /// ===== ACTIONS =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.thumb_up_alt_sharp,
                    size: 18.sp,
                    color: AppColors.white.withOpacity(0.5),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "24",
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.5),
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      final result = await Navigator.pushNamed(
                        context,
                        AppRoutes.reviews,
                        arguments: {
                          'movieId': movieId,
                          'review': review,
                          'movie': movie,
                        },
                      );

                      if (result == true) {
                        context.read<MovieDetailsCubit>().fetchReviews(movieId);
                      }
                    },
                    child: Container(
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
                          Icon(Icons.edit, size: 14.sp, color: AppColors.white),
                          SizedBox(width: 4.w),
                          Text("Edit", style: AppTextStyles.textStyle12),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  InkWell(
                    onTap: () {},
                    child: Container(
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
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
