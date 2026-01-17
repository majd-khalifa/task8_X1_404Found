// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/helper/snack_bar_helper.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/view/details/cubit/details_state.dart';
import 'package:task8/view/details/cubit/detais_cubit.dart';
import 'package:task8/view/details/sections/details_header.dart';
import 'package:task8/view/details/sections/rating_and_synopsis_section.dart';
import 'package:task8/view/details/sections/review_section.dart';
import 'package:task8/view/details/widgets/wraper.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = MovieDetailsCubit(ApiServices());
        cubit.fetchMovie(movieId);
        cubit.fetchReviews(movieId);
        return cubit;
      },
      child: BlocListener<MovieDetailsCubit, MovieDetailsState>(
        listener: (BuildContext context, MovieDetailsState state) {
          (context, state) {
            SnackBarHelper.showError(context, state.errorMessage!);
          };
        },
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            (previous, current) =>
                previous.errorMessage != current.errorMessage &&
                current.errorMessage != null;
            if (state.isLoadingMovie) {
              return const Scaffold(
                backgroundColor: AppColors.backgroundDark,
                body: Center(child: CircularProgressIndicator()),
              );
            }

            final movie = state.movie!;
            if (state.isLoadingMovie) {
              return const Scaffold(
                backgroundColor: AppColors.backgroundDark,
                body: Center(child: CircularProgressIndicator()),
              );
            }
            return Scaffold(
              backgroundColor: AppColors.backgroundDark,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    DetailsHeader(movie: movie),
                    SizedBox(height: 16.h),
                    ContentWrapper(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingAndSynopsisSection(),
                          ReviewSection(movie: movie, movieId: movieId),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
