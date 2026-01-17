import 'package:equatable/equatable.dart';
import 'package:task8/models/index.dart';

class MovieDetailsState extends Equatable {
  final bool isLoadingMovie; // loading film data state
  final bool isLoadingReviews; // loading reviews state
  final Movie? movie; // film data
  final List<Review> reviews; // list of reviews
  final Review? userReview; // current user's review
  final bool isExpanded; // whether all reviews are shown
  final String? errorMessage; // error message if any

  const MovieDetailsState({
    this.isLoadingMovie = true,
    this.isLoadingReviews = true,
    this.movie,
    this.reviews = const [],
    this.userReview,
    this.isExpanded = false,
    this.errorMessage,
  });

  MovieDetailsState copyWith({
    bool? isLoadingMovie,
    bool? isLoadingReviews,
    Movie? movie,
    List<Review>? reviews,
    Review? userReview,
    bool? isExpanded,
    String? errorMessage,
  }) {
    return MovieDetailsState(
      isLoadingMovie: isLoadingMovie ?? this.isLoadingMovie,
      isLoadingReviews: isLoadingReviews ?? this.isLoadingReviews,
      movie: movie ?? this.movie,
      reviews: reviews ?? this.reviews,
      userReview: userReview ?? this.userReview,
      isExpanded: isExpanded ?? this.isExpanded,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoadingMovie,
    isLoadingReviews,
    movie,
    reviews,
    userReview,
    isExpanded,
    errorMessage,
  ];
}
