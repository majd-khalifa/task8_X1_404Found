import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/data/review_api.dart';
import 'package:task8/models/review_model.dart';
import 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(const ReviewsState());

  // load initial review for editing
  void loadInitialReview(Review? review) {
    if (review == null) return;

    emit(
      state.copyWith(
        rating: review.rating.toDouble(),
        comment: review.comment,
        isEditing: true,
        reviewId: review.id,
      ),
    );
  }

  // update rating
  void updateRating(double value) {
    emit(state.copyWith(rating: value));
  }

  // update comment
  void updateComment(String value) {
    emit(state.copyWith(comment: value));
  }

  // submit review (add or update)
  Future<void> submitReview(int movieId) async {
    if (state.comment.trim().isEmpty) {
      emit(state.copyWith(error: "Review cannot be empty"));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    bool success;

    try {
      if (state.isEditing) {
        success = await ReviewApi.updateReview(
          movieId: movieId,
          reviewId: state.reviewId!,
          rating: state.rating,
          comment: state.comment,
        );
      } else {
        success = await ReviewApi.addReview(
          movieId: movieId,
          rating: state.rating,
          comment: state.comment,
        );
      }

      if (success) {
        emit(state.copyWith(isLoading: false, success: true));
      } else {
        emit(
          state.copyWith(isLoading: false, error: "Failed to submit review"),
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Something went wrong"));
    }
  }
}
