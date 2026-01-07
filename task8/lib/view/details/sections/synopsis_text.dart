// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';

class SynopsisText extends StatelessWidget {
  const SynopsisText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
          ),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              "Read more",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
