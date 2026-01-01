import 'package:flutter/material.dart';
import 'package:task8/core/constants/app_color.dart';

class PosterSection extends StatelessWidget {
  const PosterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176,
      height: 256,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight, width: 2),
        image: const DecorationImage(
          image: AssetImage("assets/images/unnamed (8).png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
