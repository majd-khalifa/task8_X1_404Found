import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/data/movie_api.dart';
import 'package:task8/models/movie.dart';
import 'package:task8/models/review.dart';

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
  final ApiServices _api = ApiServices();
  List<String> categories = ["All"];
  List<Movie> allMovies = [];
  List<Movie> filteredMovies = [];
  Map<int, double> movieRatings = {};
  Future<void>? loadMoviesFuture;
  bool reviewLoading = true;

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

  Future<void> fetchMovieRating(int movieId) async {
    if (movieRatings.containsKey(movieId)) return;

    try {
      final response = await _api.getData(url: ApiLink.movieReviews(movieId));

      if (response.isNotEmpty && response[0]['data'] != null) {
        final reviews = List.from(
          response[0]['data'],
        ).map((e) => Review.fromJson(Map<String, dynamic>.from(e))).toList();

        final avg = Review.calculateAverageRating(reviews);

        setState(() {
          movieRatings[movieId] = avg;
          reviewLoading = false;
        });
      } else {
        movieRatings[movieId] = 0.0;
      }
    } catch (_) {
      movieRatings[movieId] = 0.0;
    }
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
                  fetchMovieRating(movie.id);

                  return reviewLoading
                      ? SizedBox(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : TrendingCard(
                          image: movie.posterUrl,
                          title: movie.title,
                          subtitle: movie.description,
                          rating:
                              movieRatings[movie.id]?.toStringAsFixed(1) ?? "—",
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
                itemCount: filteredMovies.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (_, index) {
                  final movie = filteredMovies[index];
                  fetchMovieRating(movie.id);
                  return reviewLoading
                      ? SizedBox(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : MovieGridItem(
                          image: movie.posterUrl,
                          title: movie.title,
                          rating:
                              movieRatings[movie.id]?.toStringAsFixed(1) ?? "—",

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

  // double calculateAverageRating(List<Review> reviews) {
  //   if (reviews.isEmpty) return 0.0;
  //   final total = reviews.fold<int>(0, (sum, r) => sum + r.rating);
  //   return total / reviews.length;
  // }
}
