// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RottenTomatoes extends StatelessWidget {
  const RottenTomatoes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
