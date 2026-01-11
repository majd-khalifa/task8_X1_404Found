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
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json['id'],
    title: json['title'],
    genreId: json['genre_id'],
    genreName: json['genre_name'],
    year: json['year'],
    duration: json['duration'],
    language: json['language'],
    posterUrl: json['poster_url'],
    description: json['description'],
    trailerUrl: json['trailer_url'],
    ageRating: json['age_rating'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'genre_id': genreId,
    'genre_name': genreName,
    'year': year,
    'duration': duration,
    'language': language,
    'poster_url': posterUrl,
    'description': description,
    'trailer_url': trailerUrl,
    'age_rating': ageRating,
  };

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
  ];
}
