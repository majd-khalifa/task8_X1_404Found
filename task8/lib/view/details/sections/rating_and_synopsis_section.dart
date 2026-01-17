// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_image.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/models/review_model.dart';
import 'package:task8/view/details/cubit/detais_cubit.dart';
import 'package:task8/view/details/cubit/details_state.dart';
import 'package:task8/view/details/sections/cast_list_widget.dart';
import 'package:task8/view/details/widgets/expandable_text.dart';

class RatingAndSynopsisSection extends StatelessWidget {
  const RatingAndSynopsisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        final movie = state.movie;
        final reviews = state.reviews;

        if (movie == null) {
          return const SizedBox();
        }

        final double avgRating = Review.calculateAverageRating(reviews);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingCardWidget(avgRating: avgRating, reviews: reviews),

                  /// 📜 Synopsis
                  Text(
                    "Synopsis",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ExpandableText(
                    text: movie.description,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16.sp,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            /// 🎭 Cast
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Cast", style: AppTextStyles.textStyle18),
                ),
                const SizedBox(height: 12),
                CastListWidget(
                  castImages: [
                    AppImage.castimage1,
                    AppImage.castimage2,
                    AppImage.castimage1,
                    AppImage.castimage2,
                  ],
                  castNames: [
                    "Matthew M.",
                    "Anne H.",
                    "Jessica C.",
                    "Mackenzie F.",
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class RatingCardWidget extends StatelessWidget {
  final double avgRating;
  final List reviews;

  const RatingCardWidget({
    super.key,
    required this.avgRating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.cardDark, width: 1.w),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Average Rating", style: AppTextStyles.textStyle12),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    avgRating.toStringAsFixed(1),
                    style: AppTextStyles.textStyle30,
                  ),
                  SizedBox(width: 8.w),
                  reviews.isEmpty
                      ? const CircularProgressIndicator()
                      : Row(
                          children: List.generate(5, (index) {
                            double rating = avgRating;
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
          ),
          SizedBox(width: 16.w),
          Container(
            height: 40.h,
            width: 1.w,
            color: Colors.white.withOpacity(0.1),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Rotten Tomatoes",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.local_activity,
                      size: 18.sp,
                      color: const Color(0xFFF44336),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "73%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
