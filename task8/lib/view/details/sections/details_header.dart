// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/models/movie.dart';
import 'package:task8/view/details/widgets/info_tag.dart';
import 'package:task8/view/details/widgets/circle_button.dart';

class DetailsHeader extends StatelessWidget {
  final Movie movie;
  const DetailsHeader({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 1.sw,
        height: 0.64.sh,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                movie.posterUrl,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.65),
                colorBlendMode: BlendMode.darken,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ), // 🔹 Gradient Overlay واحد ناعم (مطابق Stitch)
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
            ), // 🔹 المحتوى
            Positioned.fill(
              child: Column(
                children: [
                  // 🔹 أزرار الهيدر
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 26.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleButton(
                          icon: Icons.arrow_back,
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.home);
                          },
                        ),
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
                    margin: EdgeInsets.only(top: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.borderLight,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(movie.posterUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(movie.title, style: AppTextStyles.textStyle30),
                  const SizedBox(height: 8),
                  Text(
                    "Sci-Fi • Adventure • Drama",
                    style: AppTextStyles.textStyle14,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderStrong),
                            borderRadius: BorderRadius.circular(6.r),
                            color: AppColors.cardDark,
                          ),
                          child: Text(
                            movie.ageRating,
                            style: AppTextStyles.textStyle10.copyWith(
                              color: AppColors.textPrimary.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        InfoTag(
                          icon: Icons.calendar_month,
                          text: movie.year.toString(),
                        ),
                        SizedBox(width: 15.w),
                        InfoTag(
                          icon: Icons.schedule,
                          text:
                              "${movie.duration ~/ 60}h ${movie.duration % 60}m",
                        ),
                        SizedBox(width: 15.w),
                        InfoTag(icon: Icons.translate, text: movie.language),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.trailer,
                                  arguments: {
                                    'movieId': movie.id,
                                    'title': movie.title,
                                    'posterUrl': movie.posterUrl,
                                  },
                                );
                              },
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
      ),
    );
  }
}
