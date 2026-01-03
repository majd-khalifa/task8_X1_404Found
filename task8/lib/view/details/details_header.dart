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
      height: 0.6.sh,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 0.7.sh,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Colors.black.withOpacity(0.3),
                    // const Color(0xFF191022).withOpacity(0.6),
                    // const Color(0xFF191022),
                    AppColors.primary, Colors.purple,
                  ],
                  stops: [0.0, 0.8],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                // 🔹 أزرار الهيدر
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleButton(icon: Icons.arrow_back),
                      Row(
                        children: [
                          CircleButton(icon: Icons.share),
                          SizedBox(width: 12),
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

                    image: const DecorationImage(
                      image: AssetImage(AppImage.posterImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 🔹 اسم الفيلم
                Text("Interstellar", style: AppTextStyles.textStyle30),

                const SizedBox(height: 8),

                // 🔹 التصنيفات
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
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
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
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
