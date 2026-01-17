import 'package:equatable/equatable.dart';
import 'package:task8/models/index.dart';

class MovieDetailsState extends Equatable {
  final bool isLoadingMovie;     // حالة تحميل بيانات الفيلم
  final bool isLoadingReviews;   // حالة تحميل المراجعات
  final Movie? movie;            // بيانات الفيلم
  final List<Review> reviews;    // قائمة المراجعات
  final Review? userReview;      // مراجعة المستخدم الحالي
  final bool isExpanded;         // هل أظهرت كل المراجعات؟
  final String? errorMessage;    // رسالة الخطأ

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
  List<Object?> get props =>
      [isLoadingMovie, isLoadingReviews, movie, reviews, userReview, isExpanded, errorMessage];
}
