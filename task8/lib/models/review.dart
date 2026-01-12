import 'package:equatable/equatable.dart';
import 'user.dart';

class Review extends Equatable {
  final int id;
  final int rating;
  final String comment;
  final int approved;
  final User user;
  final int movieId;
  final String movieName;

  const Review({
    required this.id,
    required this.rating,
    required this.comment,
    required this.approved,
    required this.user,
    required this.movieId,
    required this.movieName,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json['id'] ?? 0,
    rating: json['rating'] ?? 0,
    comment: json['comment']?.toString() ?? '',
    approved: json['approved'] ?? 0,
    user: User.fromJson(Map<String, dynamic>.from(json['user'] ?? {})),
    movieId: json['movie_id'] ?? 0,
    movieName: json['movie_name']?.toString() ?? 'Unknown Movie',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'rating': rating,
    'comment': comment,
    'approved': approved,
    'user': user.toJson(),
    'movie_id': movieId,
    'movie_name': movieName,
  };

  static double calculateAverageRating(List<Review> reviews) {
    if (reviews.isEmpty) return 0.0; // لو ما في تعليقات

    // اجمع كل التقييمات
    final total = reviews.fold<int>(0, (sum, r) => sum + r.rating);

    // اقسم على عدد التعليقات
    return total / reviews.length;
  }

  @override
  List<Object?> get props => [
    id,
    rating,
    comment,
    approved,
    user,
    movieId,
    movieName,
  ];
}
