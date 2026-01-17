import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,

          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),

          20.verticalSpace,

          // Categories
          SizedBox(
            height: 36.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: 6,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (_, __) => Container(
                width: 80.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(999.r),
                ),
              ),
            ),
          ),

          30.verticalSpace,

          // Trending title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              width: 140.w,
              height: 20.h,
              color: Colors.grey.shade900,
            ),
          ),

          12.verticalSpace,

          // Trending cards
          SizedBox(
            height: 280.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: 5,
              separatorBuilder: (_, __) => SizedBox(width: 16.w),
              itemBuilder: (_, __) => Container(
                width: 144.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),

          30.verticalSpace,

          // For You title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              width: 100.w,
              height: 20.h,
              color: Colors.grey.shade900,
            ),
          ),

          12.verticalSpace,

          // Grid shimmer
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (_, __) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 220.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  8.verticalSpace,
                  Container(
                    width: 120.w,
                    height: 16.h,
                    color: Colors.grey.shade900,
                  ),
                  6.verticalSpace,
                  Container(
                    width: 80.w,
                    height: 14.h,
                    color: Colors.grey.shade900,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
