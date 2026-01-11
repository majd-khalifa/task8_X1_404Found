import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final int genreId;
  final String? genreName;
  final int year;
  final int duration;
  final String language;
  final String posterUrl;
  final String description;
  final String trailerUrl;
  final String ageRating;
  final String? createdAt;
  final String? updatedAt;
  final int? views;
  final String? movieUrl;

  const Movie({
    required this.id,
    required this.title,
    required this.genreId,
    this.genreName,
    required this.year,
    required this.duration,
    required this.language,
    required this.posterUrl,
    required this.description,
    required this.trailerUrl,
    required this.ageRating,
    this.createdAt,
    this.updatedAt,
    this.views,
    this.movieUrl,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    genreId,
    genreName,
    year,
    duration,
    language,
    posterUrl,
    description,
    trailerUrl,
    ageRating,
    createdAt,
    updatedAt,
    views,
    movieUrl,
  ];
}
