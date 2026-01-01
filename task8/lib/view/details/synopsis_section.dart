import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class RatingAndSynopsisSection extends StatelessWidget {
  const RatingAndSynopsisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.only(bottom: 24.h),
            decoration: BoxDecoration(
              color: AppColors.cardDark,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.cardDark, width: 1.w),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Average Rating", style: AppTextStyles.textStyle12),
                    SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("8.6", style: AppTextStyles.textStyle30),
                        SizedBox(width: 8.w),
                        //     Row(
                        //       children: [
                        //         Icon(
                        //           Icons.star,
                        //           size: 20.sp,
                        //           color: AppColors.primary,
                        //         ),
                        //         Icon(
                        //           Icons.star,
                        //           size: 20.sp,
                        //           color: AppColors.primary,
                        //         ),
                        //         Icon(
                        //           Icons.star,
                        //           size: 20.sp,
                        //           color: AppColors.primary,
                        //         ),
                        //         Icon(
                        //           Icons.star,
                        //           size: 20.sp,
                        //           color: AppColors.primary,
                        //         ),
                        //         Icon(
                        //           Icons.star,
                        //           size: 20.sp,
                        //           color: AppColors.primary.withOpacity(0.5),
                        //         ),
                        //       ],
                        //     ),
                        Row(
                          children: List.generate(5, (index) {
                            double rating = 4.5; // القيمة القادمة من API

                            Color color;
                            if (index < rating.floor()) {
                              color = AppColors.primary;
                            } else if (index < rating && rating % 1 != 0) {
                              color = AppColors.primary.withOpacity(0.5);
                            } else {
                              color = Colors.black;
                            }

                            return Icon(Icons.star, size: 20.sp, color: color);
                          }),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(width: 16.w),
                Container(
                  height: 40.h,
                  width: 1.w,
                  color: Colors.white.withOpacity(0.1),
                ),
                SizedBox(width: 16.w),

                // Right: Rotten Tomatoes
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Rotten Tomatoes",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.local_activity,
                            size: 18.sp,
                            color: const Color(0xFFF44336),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "73%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Text(
            "Synopsis",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),

          Text(
            "Earth's future has been riddled by disasters, famines, and droughts. "
            "There is only one way to ensure mankind's survival: Interstellar travel. "
            "A newly discovered wormhole in the far reaches of our solar system allows "
            "a team of astronauts to go where no man has gone before, a planet that may "
            "have the right environment to sustain human life.",
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 16.sp,
              height: 1.6,
            ),
          ),

          // 🟣 Read more button
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
            ),
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 8.h), // mt-2
              child: Text(
                "Read more",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14.sp, // text-sm
                  fontWeight: FontWeight.bold,
                  decoration:
                      TextDecoration.underline, // hover:underline (ثابت هنا)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
