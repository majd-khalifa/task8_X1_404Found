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
