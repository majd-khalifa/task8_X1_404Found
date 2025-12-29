class MovieModel {
  final String image;
  final String title;
  final String subtitle;
  final String rating;
  final String year;
  final String? badge;

  MovieModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.year,
    this.badge,
  });
}
