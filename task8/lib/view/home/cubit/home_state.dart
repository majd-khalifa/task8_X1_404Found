import 'package:equatable/equatable.dart';
import 'package:task8/models/movie_model.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<Movie> allMovies;
  final List<Movie> filteredMovies;
  final List<String> categories;
  final int activeCategory;
  final Map<int, double> movieRatings;
  final String searchQuery;
  final String? error;
  final String name;
  final String email;

  const HomeState({
    this.isLoading = false,
    this.allMovies = const [],
    this.filteredMovies = const [],
    this.categories = const ["All"],
    this.activeCategory = 0,
    this.movieRatings = const {},
    this.searchQuery = "",
    this.error,
    this.name = "",
    this.email = "",
  });

  HomeState copyWith({
    bool? isLoading,
    List<Movie>? allMovies,
    List<Movie>? filteredMovies,
    List<String>? categories,
    int? activeCategory,
    Map<int, double>? movieRatings,
    String? searchQuery,
    String? error,
    String? name, // added for copyWith
    String? email,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      allMovies: allMovies ?? this.allMovies,
      filteredMovies: filteredMovies ?? this.filteredMovies,
      categories: categories ?? this.categories,
      activeCategory: activeCategory ?? this.activeCategory,
      movieRatings: movieRatings ?? this.movieRatings,
      searchQuery: searchQuery ?? this.searchQuery,
      error: error,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    allMovies,
    filteredMovies,
    categories,
    activeCategory,
    movieRatings,
    searchQuery,
    error,
    name,
    email,
  ];
}
