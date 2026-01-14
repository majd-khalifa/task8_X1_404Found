// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task8/core/services/api/api_services.dart';
// import 'package:task8/core/services/api/api_link.dart';
// import 'package:task8/models/review.dart';
// import 'package:task8/models/movie.dart';
// import 'package:task8/core/constants/pref_key.dart';
// import 'package:task8/view/details/cubit/details_state.dart';

// class MovieDetailsCubit extends Cubit<MovieDetailsState> {
//   final ApiServices api;
//   MovieDetailsCubit(this.api) : super(MovieDetailsInitial());

//   /// جلب كل البيانات
//   Future<void> fetchMovieDetails(int movieId) async {
//     emit(MovieDetailsLoading());
//     try {
//       // Fetch movie
//       final movieResp = await api.getData(url: ApiLink.movieDetails(movieId));
//       final movie = Movie.fromJson(movieResp[0]['data']);

//       // Fetch reviews
//       final reviewResp = await api.getData(url: ApiLink.movieReviews(movieId));
//       List<Review> allReviews = [];
//       Review? userReview;

//       if (reviewResp.isNotEmpty && reviewResp[0]['data'] != null) {
//         final List rawData = List.from(reviewResp[0]['data']);
//         allReviews = rawData
//             .map((e) => Review.fromJson(Map<String, dynamic>.from(e)))
//             .toList();

//         try {
//           userReview = allReviews.firstWhere((r) => r.user.email == PrefKey.useremail);
//           allReviews = allReviews.where((r) => r.user.email != PrefKey.useremail).toList();
//         } catch (_) {
//           userReview = null;
//         }
//       }

//       emit(MovieDetailsLoaded(
//         movie: movie,
//         reviews: allReviews,
//         userReview: userReview,
//       ));
//     } catch (e) {
//       emit(MovieDetailsInitial()); // أو حالة خطأ
//     }
//   }

//   // DetailsHeader
//   void toggleFavorite() {
//     if (state is MovieDetailsLoaded) {
//       final current = state as MovieDetailsLoaded;
//       emit(current.copyWith(isFavorite: !current.isFavorite));
//     }
//   }

//   void toggleBookmark() {
//     if (state is MovieDetailsLoaded) {
//       final current = state as MovieDetailsLoaded;
//       emit(current.copyWith(isBookmarked: !current.isBookmarked));
//     }
//   }

//   // RatingAndSynopsisSection
//   void toggleSynopsis() {
//     if (state is MovieDetailsLoaded) {
//       final current = state as MovieDetailsLoaded;
//       emit(current.copyWith(isSynopsisExpanded: !current.isSynopsisExpanded));
//     }
//   }

//   // ReviewSection
//   void toggleReviewsExpanded() {
//     if (state is MovieDetailsLoaded) {
//       final current = state as MovieDetailsLoaded;
//       emit(current.copyWith(areReviewsExpanded: !current.areReviewsExpanded));
//     }
//   }
// }
