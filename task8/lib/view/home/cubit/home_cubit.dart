// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/data/movie_api.dart';
import 'package:task8/models/movie.dart';
import 'package:task8/models/review.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final ApiServices _api = ApiServices();

  /// ============================
  ///  Load Movies (Cubit)
  /// ============================
  Future<void> loadMovies() async {
    emit(state.copyWith(isLoading: true));

    try {
      final movies = await fetchMoviesApi();

      final categories = [
        "All",
        ...movies.map((m) => m.ageRating.trim()).toSet().toList(),
      ];

      emit(
        state.copyWith(
          isLoading: false,
          allMovies: movies,
          filteredMovies: movies,
          categories: categories,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Failed to load movies"));
    }
  }

  /// Wrapper لدالة الـ API الأصلية fetchMovies()
  Future<List<Movie>> fetchMoviesApi() async {
    return await fetchMovies(); // ← هذه من movie_api.dart
  }

  /// ============================
  ///  Fetch Rating for Movie
  /// ============================
  Future<void> fetchMovieRating(int movieId) async {
    if (state.movieRatings.containsKey(movieId)) return;

    try {
      final response = await _api.getData(url: ApiLink.movieReviews(movieId));

      if (response.isNotEmpty && response[0]['data'] != null) {
        final reviews = List.from(
          response[0]['data'],
        ).map((e) => Review.fromJson(Map<String, dynamic>.from(e))).toList();

        final avg = Review.calculateAverageRating(reviews);

        final updatedRatings = Map<int, double>.from(state.movieRatings);
        updatedRatings[movieId] = avg;

        emit(state.copyWith(movieRatings: updatedRatings));
      }
    } catch (_) {
      final updatedRatings = Map<int, double>.from(state.movieRatings);
      updatedRatings[movieId] = 0.0;
      emit(state.copyWith(movieRatings: updatedRatings));
    }
  }

  /// ============================
  ///  Filter by Category
  /// ============================
  void filterByCategory(int index) {
    if (index == 0) {
      emit(
        state.copyWith(activeCategory: index, filteredMovies: state.allMovies),
      );
      return;
    }

    final selected = state.categories[index];

    final filtered = state.allMovies
        .where((m) => m.ageRating.trim() == selected.trim())
        .toList();

    emit(state.copyWith(activeCategory: index, filteredMovies: filtered));
  }

  /// ============================
  ///  Search Movies
  /// ============================
  void searchMovies(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(searchQuery: "", filteredMovies: state.allMovies));
      return;
    }

    final filtered = state.allMovies
        .where((m) => m.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(searchQuery: query, filteredMovies: filtered));
  }

  /// ============================
  ///  Apply Filters
  /// ============================
  void applyFilter(Map data) {
    final rating = data["rating"];
    final yearFrom = data["yearFrom"];
    final yearTo = data["yearTo"];
    final durationFrom = data["durationFrom"];
    final durationTo = data["durationTo"];

    final filtered = state.allMovies.where((m) {
      bool ok = true;

      if (rating != null) ok &= m.ageRating == rating;
      if (yearFrom != null) ok &= m.year >= yearFrom;
      if (yearTo != null) ok &= m.year <= yearTo;
      if (durationFrom != null) ok &= m.duration >= durationFrom;
      if (durationTo != null) ok &= m.duration <= durationTo;

      return ok;
    }).toList();

    emit(state.copyWith(filteredMovies: filtered));
  }
}
