import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/data/movie_api.dart';
import 'package:task8/models/movie.dart';

import 'widgets/search_bar.dart';
import 'widgets/category_chip.dart';
import 'widgets/trending_card.dart';
import 'widgets/movie_grid_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int activeIndex = 0;

  List<String> categories = ["All"];
  List<Movie> allMovies = [];
  List<Movie> filteredMovies = [];

  Future<void>? loadMoviesFuture;

  @override
  @override
  void initState() {
    super.initState();
    loadMoviesFuture = loadMovies();
  }

  Future<void> loadMovies() async {
    final movies = await fetchMovies();

    final uniqueRatings = movies
        .map((m) => m.ageRating.trim())
        .toSet()
        .toList();

    setState(() {
      allMovies = movies;
      categories = ["All", ...uniqueRatings];
      filteredMovies = movies;
    });
  }

  void filterByCategory(int index) {
    setState(() {
      activeIndex = index;

      if (index == 0) {
        filteredMovies = allMovies;
      } else {
        final selected = categories[index];
        filteredMovies = allMovies
            .where((m) => m.ageRating.trim() == selected.trim())
            .toList();
      }
    });
  }

  void searchMovies(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMovies = allMovies;
      } else {
        filteredMovies = allMovies
            .where((m) => m.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void applyFilter(Map data) {
    final rating = data["rating"];
    final yearFrom = data["yearFrom"];
    final yearTo = data["yearTo"];
    final durationFrom = data["durationFrom"];
    final durationTo = data["durationTo"];

    setState(() {
      filteredMovies = allMovies.where((m) {
        bool ok = true;

        if (rating != null) ok &= m.ageRating == rating;
        if (yearFrom != null) ok &= m.year >= yearFrom;
        if (yearTo != null) ok &= m.year <= yearTo;
        if (durationFrom != null) ok &= m.duration >= durationFrom;
        if (durationTo != null) ok &= m.duration <= durationTo;

        return ok;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadMoviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSearchBar(onChanged: searchMovies, onFilter: applyFilter),

            16.verticalSpace,

            // Categories
            SizedBox(
              height: 36.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: categories.length,
                separatorBuilder: (_, __) => SizedBox(width: 12.w),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () => filterByCategory(index),
                    child: CategoryChip(
                      label: categories[index],
                      isActive: activeIndex == index,
                    ),
                  );
                },
              ),
            ),

            20.verticalSpace,

            // Trending
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
                itemCount: allMovies.length > 5 ? 5 : allMovies.length,
                separatorBuilder: (_, __) => SizedBox(width: 16.w),
                itemBuilder: (_, index) {
                  final movie = allMovies[index];
                  return TrendingCard(
                    image: movie.posterUrl,
                    title: movie.title,
                    subtitle: movie.description,
                    rating: movie.ageRating,
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
                itemCount: filteredMovies.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (_, index) {
                  final movie = filteredMovies[index];
                  return MovieGridItem(
                    image: movie.posterUrl,
                    title: movie.title,
                    rating: movie.ageRating,
                    year: movie.year.toString(),
                    badge: movie.genreName,
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
