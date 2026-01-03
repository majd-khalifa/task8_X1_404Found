// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class MovieGridItem extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String year;
  final String? badge;

  const MovieGridItem({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.year,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: AspectRatio(
                aspectRatio: 2 / 3, // يمنع Overflow
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),

            if (badge != null)
              Positioned(
                top: 8.0,
                left: 8.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha((0.9 * 255).round()),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    badge!,
                    style: AppTextStyles.textStyle12.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(height: 6.0),

        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.textStyle16.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 4.0),

        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 14.0),
            const SizedBox(width: 4.0),
            Text(rating, style: AppTextStyles.textStyle12),
            const SizedBox(width: 6.0),
            Container(
              width: 3.0,
              height: 3.0,
              decoration: const BoxDecoration(
                color: Colors.white54,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6.0),
            Text(
              year,
              style: AppTextStyles.textStyle12.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
