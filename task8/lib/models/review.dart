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
    id: json['id'],
    rating: json['rating'],
    comment: json['comment'],
    approved: json['approved'],
    user: User.fromJson(json['user']),
    movieId: json['movie_id'],
    movieName: json['movie_name'],
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
