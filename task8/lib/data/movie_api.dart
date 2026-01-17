// ignore_for_file: avoid_print

import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/models/movie.dart';
import 'package:task8/models/api_response.dart';

/// =======================
///  Get All Movies
/// =======================
Future<List<Movie>> fetchMovies() async {
  final raw = await ApiServices().getData(url: ApiLink.movies);

  // شكل الـ API:
  // {
  //   "current_page": 1,
  //   "data": [ ... ]
  // }

  final list = raw['data'] as List;

  return list.map((e) => Movie.fromJson(e)).toList();
}

/// =======================
///  Get Movie Details
/// =======================
Future<Movie> fetchMovieDetails(int movieId) async {
  final raw = await ApiServices().getData(url: ApiLink.movieDetails(movieId));

  // شكل الـ API:
  // [
  //   { "data": { ... }, "message": "movie viewed" },
  //   200
  // ]

  final response = ApiResponse<Movie>.fromJson(
    raw,
    (data) => Movie.fromJson(data),
  );

  return response.data;
}

/// =======================
///  Trailer URL (From API)
/// =======================
class MovieApi {
  Future<String?> getTrailerUrl(int movieId) async {
    try {
      final raw = await ApiServices().getData(
        url: ApiLink.movieDetails(movieId),
      );

      if (raw is List && raw.isNotEmpty) {
        final data = raw[0]['data'];
        if (data != null && data['trailer_url'] != null) {
          return data['trailer_url'] as String;
        }
      }
      return null;
    } catch (e) {
      print('Error fetching trailer URL: $e');
      return null;
    }
  }

  static String? extractYoutubeVideoId(String url) {
    final regExp = RegExp(
      r'(?:youtube\.com\/watch\?v=|youtu\.be\/)([^&\n?#]+)',
      caseSensitive: false,
    );
    final match = regExp.firstMatch(url);
    return match?.group(1);
  }
}
