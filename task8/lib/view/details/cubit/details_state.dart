// import 'package:task8/models/movie.dart';
// import 'package:task8/models/review.dart';

// abstract class MovieDetailsState {}

// class MovieDetailsInitial extends MovieDetailsState {}

// class MovieDetailsLoading extends MovieDetailsState {}

// class MovieDetailsLoaded extends MovieDetailsState {
//   final Movie movie;

//   // DetailsHeader
//   final bool isFavorite;
//   final bool isBookmarked;

//   // RatingAndSynopsisSection
//   final bool isSynopsisExpanded;

//   // Reviews
//   final List<Review> reviews;
//   final Review? userReview;
//   final bool areReviewsExpanded;

//   MovieDetailsLoaded({
//     required this.movie,
//     this.isFavorite = false,
//     this.isBookmarked = false,
//     this.isSynopsisExpanded = false,
//     this.reviews = const [],
//     this.userReview,
//     this.areReviewsExpanded = false,
//   });

//   MovieDetailsLoaded copyWith({
//     Movie? movie,
//     bool? isFavorite,
//     bool? isBookmarked,
//     bool? isSynopsisExpanded,
//     List<Review>? reviews,
//     Review? userReview,
//     bool? areReviewsExpanded,
//   }) {
//     return MovieDetailsLoaded(
//       movie: movie ?? this.movie,
//       isFavorite: isFavorite ?? this.isFavorite,
//       isBookmarked: isBookmarked ?? this.isBookmarked,
//       isSynopsisExpanded: isSynopsisExpanded ?? this.isSynopsisExpanded,
//       reviews: reviews ?? this.reviews,
//       userReview: userReview ?? this.userReview,
//       areReviewsExpanded: areReviewsExpanded ?? this.areReviewsExpanded,
//     );
//   }
// }
