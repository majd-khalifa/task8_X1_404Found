import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/helper/snack_bar_helper.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/models/index.dart';
import 'package:task8/view/details/sections/details_header.dart';
import 'package:task8/view/details/sections/rating_and_synopsis_section.dart';
import 'package:task8/view/details/sections/review_section.dart';
import 'package:task8/view/details/widgets/wraper.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final ApiServices _api = ApiServices();
  Movie? movie;
  bool isLoading = true;
  bool reviewsLoading = true;
  List<Review> reviews = [];

  Future<void> fetchReviews() async {
    try {
      final response = await _api.getData(
        url: ApiLink.movieReviews(widget.movieId),
      );

      if (response.isNotEmpty && response[0]['data'] != null) {
        final List data = List.from(response[0]['data']);

        setState(() {
          reviews = data
              .map((e) => Review.fromJson(Map<String, dynamic>.from(e)))
              .toList();
          reviewsLoading = false;
        });
      }
    } catch (_) {
      reviewsLoading = false;
    }
  }

  Future<void> fetchMovieDetails() async {
    try {
      final response = await _api.getData(
        url: ApiLink.movieDetails(widget.movieId),
      );

      // التحقق من أن response ليست فارغة وأن العنصر الأول يحتوي على data
      if (response.isNotEmpty && response[0]['data'] != null) {
        final movieData = response[0]['data'];

        setState(() {
          movie = Movie.fromJson(movieData);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        SnackBarHelper.showError(context, "Movie data is empty");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      SnackBarHelper.showError(context, "Failed to load movie details");
      print("Error fetching movie details: $e"); // للتأكد من الخطأ الحقيقي
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
    fetchReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: isLoading
          ? const Center(
              child:
                  CircularProgressIndicator(), // يظهر بالمنتصف طوال مدة التحميل
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  // الهيدر الكامل (خلفية + بوستر + اسم الفيلم + أزرار)
                  DetailsHeader(movie: movie!),

                  SizedBox(height: 16.h),
                  // المحتوى بعد الهيدر
                  ContentWrapper(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingAndSynopsisSection(
                          movie: movie!,
                          reviews: reviews,
                        ),
                        ReviewSection(movieId: movie!.id),

                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
