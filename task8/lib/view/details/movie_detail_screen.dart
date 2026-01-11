import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/view/details/sections/rating_and_synopsis_section.dart';
import 'package:task8/view/details/sections/review_section.dart';
import 'package:task8/view/details/sections/details_header.dart';
import 'package:task8/view/details/widgets/wraper.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

bool isloading = true;
List movies = [];

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الهيدر الكامل (خلفية + بوستر + اسم الفيلم + أزرار)
            DetailsHeader(),
            const SizedBox(height: 15),
            // المحتوى بعد الهيدر
            ContentWrapper(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsBody(),
                  ReviewSection(),
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
