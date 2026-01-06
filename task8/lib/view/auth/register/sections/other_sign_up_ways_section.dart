import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/view/auth/widgets/social_button.dart';

class OtherSignUpWaysSection extends StatelessWidget {
  const OtherSignUpWaysSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.border)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Or continue with',
                style: AppTextStyles.textStyle14.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.border)),
          ],
        ),

        SizedBox(height: 24.h),

        Row(
          children: [
            Expanded(
              child: SocialButton(
                icon: FontAwesomeIcons.google,
                text: 'Google',
                onPressed: () {},
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: SocialButton(
                icon: FontAwesomeIcons.apple,
                text: 'Apple',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
