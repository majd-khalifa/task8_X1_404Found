import 'package:equatable/equatable.dart';

class ReviewsState extends Equatable {
  final double rating;
  final String comment;
  final bool isLoading;
  final bool success;
  final String? error;
  final bool isEditing;
  final int? reviewId;

  const ReviewsState({
    this.rating = 4.0,
    this.comment = "",
    this.isLoading = false,
    this.success = false,
    this.error,
    this.isEditing = false,
    this.reviewId,
  });

  ReviewsState copyWith({
    double? rating,
    String? comment,
    bool? isLoading,
    bool? success,
    String? error,
    bool? isEditing,
    int? reviewId,
  }) {
    return ReviewsState(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      error: error,
      isEditing: isEditing ?? this.isEditing,
      reviewId: reviewId ?? this.reviewId,
    );
  }

  @override
  List<Object?> get props => [
    rating,
    comment,
    isLoading,
    success,
    error,
    isEditing,
    reviewId,
  ];
}
