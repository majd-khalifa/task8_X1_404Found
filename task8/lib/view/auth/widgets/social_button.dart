// widgets/social_button.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class SocialButton extends StatelessWidget {
  final IconData? icon;
  final Widget? customIcon;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? iconColor;
  final bool isFacebook;

  const SocialButton({
    super.key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.cardBackground,
    this.customIcon,
    this.iconColor,
    this.isFacebook = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: isFacebook
            ? null
            : Border.all(color: AppColors.border.withOpacity(0.5), width: 1),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: isFacebook
                  ? Colors.white
                  : (iconColor ?? AppColors.textPrimary),
              size: 15,
            ),

            const SizedBox(width: 12),

            Text(
              text,
              style: AppTextStyles.textStyle16.copyWith(
                color: isFacebook ? Colors.white : AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
