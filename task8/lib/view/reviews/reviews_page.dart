// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/helper/snack_bar_helper.dart';
import 'package:task8/data/review_api.dart';
import 'package:task8/models/movie.dart';
import 'package:task8/models/review.dart';
import 'widgets/reviews_header.dart';
import 'widgets/reviews_poster_card.dart';
import 'widgets/reviews_rating.dart';
import 'widgets/reviews_textbox.dart';
import 'widgets/reviews_submit.dart';

class ReviewsPage extends StatefulWidget {
  final int movieId;
  final Review? review;
  final Movie movie;

  const ReviewsPage({
    super.key,
    required this.movieId,
    this.review,
    required this.movie,
  });

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  late TextEditingController controller;
  double rating = 4.0;
  bool isSubmitting = false;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.review?.comment ?? "");
    rating = widget.review?.rating.toDouble() ?? 4.0;
  }

  Future<void> submit() async {
    final text = controller.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Review cannot be empty")));
      return;
    }
    setState(() => isSubmitting = true);
    bool success;
    try {
      if (widget.review == null) {
        // إضافة ريفيو
        success = await ReviewApi.addReview(
          movieId: widget.movieId,
          rating: rating,
          comment: text,
        );
      } else {
        // تعديل ريفيو
        success = await ReviewApi.updateReview(
          movieId: widget.movieId,
          reviewId: widget.review!.id,
          rating: rating,
          comment: text,
        );
      }

      if (success) {
        Navigator.pop(context, true);
      } else {
        SnackBarHelper.showError(context, "Failed to submit review");
      }
    } finally {
      /// ✅ إيقاف الـ loading
      if (mounted) {
        setState(() => isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              ReviewsHeader(),
              SizedBox(height: 16.h),
              ReviewsPosterCard(movie: widget.movie),
              SizedBox(height: 20.h),
              ReviewsRating(
                rating: rating,
                onRate: (v) => setState(() => rating = v),
              ),
              SizedBox(height: 18.h),
              ReviewsTextBox(controller: controller),
              SizedBox(height: 18.h),
              ReviewsSubmit(
                controller: controller,
                rating: rating,
                movieId: widget.movieId,
                onSubmit: submit,
                isLoading: isSubmitting,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBackground extends StatelessWidget {
  const TopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCY6ooZ2L1Od87sNGLjXDt2G97JQy1lk_F2HZAjV1ESVxSBlPP8uet6x9DW9fW5YI0ceJrB7uDgyLCGjHklcAumj6utJKh7HaX19T036HbYDZnHjJshW91Q80qg3JyGg8gFA2aL9b1aipiSUovFj4plzvncSYljXtR_81hi4Rqtmvs_QGwuiV2jnu6Amw3-bPyQMFPGPJrQmpk40AeFCMczgT_oZMuxWfDJmK4AcAJ7pLgWsyK_cIGUi3P8cmB7YFdZVd7OML17GN3Y',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.6),
                AppColors.backgroundDark.withOpacity(0.9),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
