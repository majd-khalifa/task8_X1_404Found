import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/helper/snack_bar_helper.dart';
import 'package:task8/models/movie_model.dart';
import 'package:task8/models/review_model.dart';
import 'cubit/reviews_cubit.dart';
import 'cubit/reviews_state.dart';

import 'widgets/reviews_header.dart';
import 'widgets/reviews_poster_card.dart';
import 'widgets/reviews_rating.dart';
import 'widgets/reviews_textbox.dart';
import 'widgets/reviews_submit.dart';

class ReviewsPage extends StatelessWidget {
  final int movieId;
  final Review? review;
  final Movie movie;

  const ReviewsPage({
    super.key,
    required this.movieId,
    this.review,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReviewsCubit()..loadInitialReview(review),
      child: BlocListener<ReviewsCubit, ReviewsState>(
        listener: (context, state) {
          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
          }

          if (state.success) {
            Navigator.pop(context, true);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundDark,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: BlocBuilder<ReviewsCubit, ReviewsState>(
                builder: (context, state) {
                  final cubit = context.read<ReviewsCubit>();

                  return Column(
                    children: [
                      const ReviewsHeader(),
                      SizedBox(height: 16.h),

                      ReviewsPosterCard(movie: movie),
                      SizedBox(height: 20.h),

                      ReviewsRating(
                        rating: state.rating,
                        onRate: cubit.updateRating,
                      ),

                      SizedBox(height: 18.h),

                      ReviewsTextBox(
                        controller: TextEditingController(text: state.comment)
                          ..selection = TextSelection.fromPosition(
                            TextPosition(offset: state.comment.length),
                          ),
                        onChanged: cubit.updateComment,
                      ),

                      SizedBox(height: 18.h),

                      ReviewsSubmit(
                        isLoading: state.isLoading,
                        onSubmit: () => cubit.submitReview(movieId),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
