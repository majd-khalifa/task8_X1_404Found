import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/view/home/cubit/home_cubit.dart';
import 'package:task8/view/home/cubit/home_state.dart';

import 'widgets/search_bar.dart';
import 'widgets/category_chip.dart';
import 'widgets/trending_card.dart';
import 'widgets/movie_grid_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        if (state.isLoading) {
          return const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.error != null) {
          return Center(
            child: Text(
              state.error!,
              style: AppTextStyles.textStyle16.copyWith(color: Colors.red),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            AppSearchBar(
              onChanged: cubit.searchMovies,
              onFilter: cubit.applyFilter,
            ),

            16.verticalSpace,

            // Categories
            SizedBox(
              height: 36.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: state.categories.length,
                separatorBuilder: (_, __) => SizedBox(width: 12.w),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () => cubit.filterByCategory(index),
                    child: CategoryChip(
                      label: state.categories[index],
                      isActive: state.activeCategory == index,
                    ),
                  );
                },
              ),
            ),

            20.verticalSpace,

            // Trending Now
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text("Trending Now", style: AppTextStyles.textStyle20),
            ),
            12.verticalSpace,

            SizedBox(
              height: 280.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: state.allMovies.length > 5
                    ? 5
                    : state.allMovies.length,
                separatorBuilder: (_, __) => SizedBox(width: 16.w),
                itemBuilder: (_, index) {
                  final movie = state.allMovies[index];

                  // Lazy load rating
                  cubit.fetchMovieRating(movie.id);

                  final rating = state.movieRatings[movie.id];

                  return TrendingCard(
                    image: movie.posterUrl,
                    title: movie.title,
                    subtitle: movie.description,
                    rating: rating?.toStringAsFixed(1) ?? "—",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.details,
                        arguments: movie.id,
                      );
                    },
                  );
                },
              ),
            ),

            20.verticalSpace,

            // For You
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text("For You", style: AppTextStyles.textStyle20),
            ),
            12.verticalSpace,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.filteredMovies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (_, index) {
                  final movie = state.filteredMovies[index];

                  cubit.fetchMovieRating(movie.id);

                  final rating = state.movieRatings[movie.id];

                  return MovieGridItem(
                    image: movie.posterUrl,
                    title: movie.title,
                    rating: rating?.toStringAsFixed(1) ?? "—",
                    year: movie.year.toString(),
                    badge: movie.genreName,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.details,
                        arguments: movie.id,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
