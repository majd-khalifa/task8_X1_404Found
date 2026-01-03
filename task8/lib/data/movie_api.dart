class MovieApi {
  Future<String?> getTrailerUrl(int movieId) async {
    // For demo, return a sample video URL
    // In real app, fetch from TMDB or other API
    return 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';
  }
}
