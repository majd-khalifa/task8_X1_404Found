import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/models/movie.dart';
import 'package:task8/models/api_response.dart';

Future<List<Movie>> fetchMovies() async {
  final raw = await ApiServices().getData(url: ApiLink.movies);

  final response = ApiResponse<List<Movie>>.fromJson(
    raw,
    (data) => (data as List).map((e) => Movie.fromJson(e)).toList(),
  );

  return response.data;
}

class MovieApi {
  Future<String?> getTrailerUrl(int movieId) async {
    return 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';
  }
}
