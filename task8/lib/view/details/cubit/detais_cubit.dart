import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/models/index.dart';
import 'package:task8/view/details/cubit/details_state.dart';
import 'package:task8/core/constants/constant.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final ApiServices api;

  MovieDetailsCubit(this.api) : super(const MovieDetailsState());

  // تحميل بيانات الفيلم
  Future<void> fetchMovie(int movieId) async {
    emit(state.copyWith(isLoadingMovie: true, errorMessage: null));
    try {
      final response = await api.getData(url: ApiLink.movieDetails(movieId));
      if (response.isNotEmpty && response[0]['data'] != null) {
        final movieData = response[0]['data'];
        emit(
          state.copyWith(
            movie: Movie.fromJson(movieData),
            isLoadingMovie: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoadingMovie: false,
            errorMessage: "Movie data is empty",
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingMovie: false,
          errorMessage: "Failed to load movie details",
        ),
      );
    }
  }

  // تحميل كل المراجعات
  Future<void> fetchReviews(int movieId) async {
    emit(state.copyWith(isLoadingReviews: true));
    try {
      final response = await api.getData(url: ApiLink.movieReviews(movieId));
      if (response.isNotEmpty && response[0]['data'] != null) {
        final List rawData = List.from(response[0]['data']);
        final allReviews = rawData
            .map((e) => Review.fromJson(Map<String, dynamic>.from(e)))
            .toList();

        Review? currentUserReview;
        try {
          currentUserReview = allReviews.firstWhere(
            (r) =>
                r.user.email.trim().toLowerCase() ==
                ConstantData.useremail.trim().toLowerCase(),
          );
        } catch (_) {
          currentUserReview = null;
        }

        final otherReviews = allReviews
            .where((r) => r != currentUserReview)
            .toList();

        emit(
          state.copyWith(
            reviews: otherReviews,
            userReview: currentUserReview,
            isLoadingReviews: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            reviews: [],
            userReview: null,
            isLoadingReviews: false,
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(isLoadingReviews: false));
    }
  }

  // لتغيير حالة expand للمراجعات
  void toggleExpanded() {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }
}
