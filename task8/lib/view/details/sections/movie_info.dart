import 'package:flutter/material.dart';
import 'package:task8/core/constants/text_style.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Interstellar", style: AppTextStyles.textStyle30),
        const SizedBox(height: 8),
        Text("Sci-Fi • Adventure • Drama", style: AppTextStyles.textStyle14),
      ],
    );
  }
}
