// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/text_style.dart';

class ReviewsTextBox extends StatelessWidget {
  final TextEditingController controller;

  const ReviewsTextBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            maxLines: null,
            style: AppTextStyles.textStyle14.copyWith(color: Colors.white70),
            decoration: InputDecoration.collapsed(
              hintText:
                  'Share your thoughts on the movie... What did you like? What did you dislike?',
              hintStyle: AppTextStyles.textStyle14.copyWith(
                color: Colors.white38,
              ),
            ),
          ),
          Positioned(
            right: 12.w,
            bottom: 8.h,
            child: Text(
              '${controller.text.length} / 500',
              style: const TextStyle(color: Colors.white38),
            ),
          ),
        ],
      ),
    );
  }
}
