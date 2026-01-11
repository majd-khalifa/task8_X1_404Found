class ApiLink {
  static const String baseUrl = 'https://movie-platform.focal-x.com';
  /// ================= Auth =================
  static const String register = '$baseUrl/api/register';
  static const String login    = '$baseUrl/api/login';
  static const String logout   = '$baseUrl/api/logout';
  /// ================= Movies =================
  static const String movies = '$baseUrl/api/movies';
  // Movie details by id
  static String movieDetails(int movieId) =>
      '$baseUrl/api/movies/$movieId';
  /// ================= Reviews =================
  // Get all reviews for a movie
  static String movieReviews(int movieId) =>
      '$baseUrl/api/movies/$movieId/reviews';
  // Specific review by id
  static String reviewDetails(int movieId, int reviewId) =>
      '$baseUrl/api/movies/$movieId/reviews/$reviewId';
}
