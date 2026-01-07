import 'package:flutter/material.dart';
import 'package:task8/core/constants/text_style.dart';
import 'circle_button.dart';

class TrailerHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBack;

  const TrailerHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(icon: Icons.keyboard_arrow_down, onTap: onBack),
              Column(
                children: [
                  Text(
                    title.toUpperCase(),
                    style: AppTextStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(subtitle, style: AppTextStyles.textStyle12),
                ],
              ),
              CircleButton(icon: Icons.cast, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
