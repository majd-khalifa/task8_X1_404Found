import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD

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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Colors.black.withOpacity(0.3),
                    // const Color(0xFF191022).withOpacity(0.6),
                    // const Color(0xFF191022),
                    AppColors.gradient1, AppColors.gradient2,
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
                        child: Icon(Icons.bookmark_add, color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
=======
import 'package:task8/view/details/widgets/circle_icon_button.dart';
import 'package:task8/core/constants/app_color.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية
        SizedBox(
          height: 0.5.sh,
          width: 1.sw,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/unnamed (7).png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        const Color(0xFF191022).withOpacity(0.6),
                        const Color(0xFF191022),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleIconButton(icon: Icons.arrow_back),
                    Row(
                      children: [
                        CircleIconButton(icon: Icons.share),
                        const SizedBox(width: 12),
                        CircleIconButton(icon: Icons.favorite),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // المحتوى فوق الخلفية
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              // البوستر
              Container(
                width: 176,
                height: 256,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderLight, width: 2),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/unnamed (8).png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Interstellar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Sci-Fi • Adventure • Drama",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _chip("PG-13"),
                  const SizedBox(width: 8),
                  _iconChip(Icons.calendar_month, "2014"),
                  const SizedBox(width: 8),
                  _iconChip(Icons.schedule, "2h 49m"),
                  const SizedBox(width: 8),
                  _iconChip(Icons.translate, "English"),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: _primaryButton()),
                  const SizedBox(width: 12),
                  _circleButton(Icons.bookmark_add),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------- REUSABLE WIDGETS ----------------

Widget _chip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white38),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );
}

Widget _iconChip(IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.white70, size: 14),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    ),
  );
}

Widget _primaryButton() {
  return Container(
    width: 1.sw,
    height: 48,
    decoration: BoxDecoration(
      color: Color(0xFF7F13EC),
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Center(
      child: Text(
        "Watch Trailer",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _circleButton(IconData icon) {
  return Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Icon(icon, color: Colors.white),
  );
}
>>>>>>> f868a9ea667c193ac5c8aebda07aa90cee954c45
