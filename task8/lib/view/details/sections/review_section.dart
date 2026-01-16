// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/models/movie.dart';
import 'package:task8/view/details/cubit/detais_cubit.dart';
import 'package:task8/view/details/cubit/details_state.dart';
import 'package:task8/view/details/widgets/review_card.dart';
import 'package:task8/view/details/widgets/user_review_card.dart';

class ReviewSection extends StatelessWidget {
  final int movieId;
  final Movie movie;

  const ReviewSection({super.key, required this.movieId, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state.isLoadingReviews) {
          return const Center(child: CircularProgressIndicator());
        }

        final userReview = state.userReview;
        final reviews = state.reviews;
        final isExpanded = state.isExpanded;

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ===== HEADER =====
              Row(
                children: [
                  Text(
                    "Reviews (${reviews.length})",
                    style: AppTextStyles.textStyle18,
                  ),
                  const Spacer(),
                  if (userReview == null)
                    FilledButton.tonal(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary.withOpacity(0.2),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () async {
                        final result = await Navigator.pushNamed(
                          context,
                          AppRoutes.reviews,
                          arguments: {
                            'movieId': movieId,
                            'review': null,
                            'movie': movie,
                          },
                        );

                        if (result == true) {
                          context.read<MovieDetailsCubit>().fetchReviews(
                            movieId,
                          );
                        }
                      },
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
                            style: AppTextStyles.textStyle14.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),

              SizedBox(height: 16.h),

              /// ===== USER REVIEW =====
              if (userReview != null)
                UserReviewCard(
                  review: userReview,
                  movie: movie,
                  movieId: movieId,
                ),

              SizedBox(height: 16.h),

              /// ===== OTHER REVIEWS =====
              ...List.generate(
                isExpanded
                    ? reviews.length
                    : (reviews.length > 2 ? 2 : reviews.length),
                (index) {
                  final review = reviews[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: ReviewCard(
                      initials: review.user.name.substring(0, 2).toUpperCase(),
                      avatarBg: AppColors.green.withOpacity(0.2),
                      avatarTextColor: AppColors.greenprofilebackground,
                      name: review.user.name,
                      rating: review.rating,
                      dateText: "Recently",
                      reviewText: review.comment,
                    ),
                  );
                },
              ),

              if (reviews.length > 2)
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.read<MovieDetailsCubit>().toggleExpanded();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text(
                        isExpanded ? "Show Less" : "View All Reviews",
                        style: AppTextStyles.textStyle14.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
