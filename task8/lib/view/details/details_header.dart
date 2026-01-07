// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_image.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/view/details/widgets/circle_button.dart';

class BackgroundHeader extends StatelessWidget {
  const BackgroundHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 26,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleButton(icon: Icons.arrow_back),
                      Row(
                        children: [
                          CircleButton(icon: Icons.share),
                          const SizedBox(width: 12),
                          CircleButton(icon: Icons.favorite_border),
                        ],
                      ),
                    ],
                  ),
                ),

                // 🔹 البوستر
                Container(
                  width: 176.w,
                  height: 256.h,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderLight, width: 2),
                    image: DecorationImage(
                      image: AssetImage(AppImage.posterImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Text("Interstellar", style: AppTextStyles.textStyle30),
                const SizedBox(height: 8),
                Text(
                  "Sci-Fi • Adventure • Drama",
                  style: AppTextStyles.textStyle14,
                ),

                const SizedBox(height: 16),

                // 🔹 الأزرار
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.6),
                                blurRadius: 10.r,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_arrow,
                              color: AppColors.textPrimary,
                            ),
                            label: Text(
                              "Watch Trailer",
                              style: AppTextStyles.textStyle16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: AppColors.borderLight,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.cardDark),
                        ),
                        child: const Icon(
                          Icons.bookmark_add,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
