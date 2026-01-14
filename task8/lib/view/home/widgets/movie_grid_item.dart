// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class MovieGridItem extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String year;
  final String? badge;
  final void Function()? onTap;

  const MovieGridItem({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.year,
    this.badge,
   required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
              ),

              if (badge != null)
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.9),
                      borderRadius: BorderRadius.circular(8.r),
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

          6.verticalSpace,

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.textStyle16.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),

          4.verticalSpace,

          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 14.sp),
              4.horizontalSpace,
              Text(rating, style: AppTextStyles.textStyle12),
              6.horizontalSpace,
              Container(
                width: 3.w,
                height: 3.w,
                decoration: const BoxDecoration(
                  color: Colors.white54,
                  shape: BoxShape.circle,
                ),
              ),
              6.horizontalSpace,
              Text(
                year,
                style: AppTextStyles.textStyle12.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
