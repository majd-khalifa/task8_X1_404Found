import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task8/core/constants/app_color.dart';

import 'package:task8/core/constants/text_style.dart';
import 'package:task8/view/auth/widgets/social_button.dart';

class LogInWithSoctialMedia extends StatelessWidget {
  const LogInWithSoctialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.border)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                'Or continue with',

                style: AppTextStyles.textStyle12.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.border)),
          ],
        ),

        SizedBox(height: 22.h),

        SizedBox(height: 22.h),

        Row(
          children: [
            Expanded(
              child: SocialButton(
                text: 'Facebook',
                isFacebook: false,
                icon: Icons.facebook,
                onPressed: () {},
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: SocialButton(
                text: 'Apple',

                iconColor: Colors.white,
                onPressed: () {},
                icon: FontAwesomeIcons.apple,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
