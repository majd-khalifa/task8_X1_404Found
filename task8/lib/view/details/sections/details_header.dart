import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_image.dart';
import 'package:task8/view/details/sections/action_buttons.dart';
import 'package:task8/view/details/sections/header_buttons.dart';
import 'package:task8/view/details/sections/movie_info.dart';
import 'package:task8/view/details/sections/movie_poster.dart';

class BackgroundHeader extends StatelessWidget {
  const BackgroundHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 1.sw,
        height: 0.65.sh,
        child: Stack(
          children: [
            // 🔹 صورة خلفية خفيفة (تعطي عمق مثل Stitch)
            Positioned(
              child: Image.asset(
                AppImage.posterImage,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.65),
                colorBlendMode: BlendMode.darken,
              ),
            ),

            // 🔹 Gradient Overlay واحد ناعم (مطابق Stitch)
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.5, 1.0],
                    colors: [
                      AppColors.backgroundGradientTop,
                      AppColors.backgroundGradientMiddle,
                      AppColors.backgroundGradientBottom,
                    ],
                  ),
                ),
              ),
            ),
            // 🔹 المحتوى
            Positioned.fill(
              child: Column(
                children: [
                  // 🔹 أزرار الهيدر
                  HeaderButtons(),
                  // 🔹 البوستر
                  MoviePoster(),
                  const SizedBox(height: 16),
                  MovieInfo(),
                  const SizedBox(height: 16),
                  // 🔹 الأزرار
                  ActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
