import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/view/details/widgets/circle_button.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
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
    );
  }
}
