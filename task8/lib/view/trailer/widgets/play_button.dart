import 'package:flutter/material.dart';
import 'package:task8/core/constants/app_color.dart';

class PlayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlayButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 88,
        height: 88,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.play_arrow, color: Colors.white, size: 44),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
