// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_image.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/models/movie.dart';
import 'package:task8/models/review.dart';
import 'package:task8/view/details/widgets/cast_item.dart';
import 'package:task8/view/details/widgets/expandable_text.dart';

class RatingAndSynopsisSection extends StatefulWidget {
  final Movie movie;
  final List<Review> reviews;
  const RatingAndSynopsisSection({
    super.key,
    required this.movie,
    required this.reviews,
  });

  @override
  State<RatingAndSynopsisSection> createState() =>
      _RatingAndSynopsisSectionState();
}

class _RatingAndSynopsisSectionState extends State<RatingAndSynopsisSection> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    final double avgRating = Review.calculateAverageRating(widget.reviews);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ⭐ Rating Card
              Container(
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
                        Text(
                          "Average Rating",
                          style: AppTextStyles.textStyle12,
                        ),
                        SizedBox(height: 4),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              avgRating.toStringAsFixed(1),
                              style: AppTextStyles.textStyle30,
                            ),
                            SizedBox(width: 8.w),
                            widget.reviews.isEmpty
                                ? CircularProgressIndicator()
                                : Row(
                                    children: List.generate(5, (index) {
                                      double rating = avgRating;

                                      Color color;
                                      if (index < rating.floor()) {
                                        color = AppColors.primary;
                                      } else if (index < rating &&
                                          rating % 1 != 0) {
                                        color = AppColors.primary.withOpacity(
                                          0.5,
                                        );
                                      } else {
                                        color = Colors.black;
                                      }

                                      return Icon(
                                        Icons.star,
                                        size: 20.sp,
                                        color: color,
                                      );
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
              ),

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
                text: widget.movie.description,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Cast", style: AppTextStyles.textStyle18),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 110.h,

              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  CastItem(img: AppImage.castimage1, name: "Matthew M."),
                  CastItem(img: AppImage.castimage2, name: "Anne H."),
                  CastItem(img: AppImage.castimage1, name: "Jessica C."),
                  CastItem(img: AppImage.castimage2, name: "Mackenzie F."),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
