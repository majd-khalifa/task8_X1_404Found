import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/view/details/cast_section.dart';
import 'package:task8/view/details/details_header.dart';
import 'package:task8/view/details/reviews_section.dart';
import 'package:task8/view/details/synopsis_section.dart';
import 'package:task8/view/details/widgets/wraper.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الهيدر الكامل (خلفية + بوستر + اسم الفيلم + أزرار)
            const BackgroundHeader(),
            // المحتوى بعد الهيدر
            ContentWrapper(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RatingAndSynopsisSection(),
                  const CastSection(),
                  const ReviewsSection(),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
