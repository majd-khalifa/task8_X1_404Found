// widgets/social_button.dart
import 'package:flutter/material.dart';


import '../core/constants/color/app_color.dart';

class SocialButton extends StatelessWidget {
  final IconData? icon;
  final Widget?customIcon;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? iconColor;
  final bool isFacebook;

  const SocialButton({
    Key? key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColor.cardBackground,
    this.customIcon,
    this.iconColor,
    this.isFacebook=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isFacebook ? AppColor.facebookBlue : backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: isFacebook ? null : Border.all(
          color: AppColor.border.withOpacity(0.5),
          width: 1,
        ),
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
            if (customIcon != null)
              customIcon!
            else if (icon != null)
              Icon(
                icon,
                color: isFacebook ? Colors.white : (iconColor ?? AppColor.textPrimary),
                size: 24,
              ),
            SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                color: isFacebook ? Colors.white : AppColor.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}