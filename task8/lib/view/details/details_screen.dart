import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/view/details/cast_section.dart';
import 'package:task8/view/details/details_header.dart';
import 'package:task8/view/details/poster_section.dart';

import 'package:task8/view/details/synopsis_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DetailsHeader(), // صار يحتوي كل شيء

              Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  color: AppColors.backgroundDark,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Column(
                  children: const [SynopsisSection(), CastSection()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
