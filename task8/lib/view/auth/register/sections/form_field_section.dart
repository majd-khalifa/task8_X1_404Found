import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/view/auth/widgets/custom_text_feild.dart';

class FormFieldSection extends StatelessWidget {
  const FormFieldSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.namevalidator,
    required this.emailvalidator,
    required this.passwordvalidator,
    required this.confirmpasswordvalidator,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String? Function(String?)? namevalidator;
  final String? Function(String?)? emailvalidator;
  final String? Function(String?)? passwordvalidator;
  final String? Function(String?)? confirmpasswordvalidator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Name
        Text(
          'Name',
          style: AppTextStyles.textStyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.h),
        CustomTextField(
          controller: nameController,
          hintText: 'Your full name',
          prefixIcon: Icons.person_sharp,
          validator: namevalidator,
        ),

        SizedBox(height: 16.h),

        /// Email
        Text(
          'Email',
          style: AppTextStyles.textStyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.h),
        CustomTextField(
          controller: emailController,
          hintText: 'name@example.com',
          prefixIcon: Icons.email_rounded,
          keyboardType: TextInputType.emailAddress,
          validator: emailvalidator,
        ),

        SizedBox(height: 16.h),

        /// Password
        Text(
          'Password',
          style: AppTextStyles.textStyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.h),
        CustomTextField(
          controller: passwordController,
          hintText: '● ● ● ● ● ● ● ●',
          prefixIcon: Icons.lock,
          isPassword: true,
          obscureText: true,
          validator: passwordvalidator,
        ),

        SizedBox(height: 16.h),

        /// Confirm Password
        Text(
          'Confirm Password',
          style: AppTextStyles.textStyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.h),
        CustomTextField(
          controller: confirmPasswordController,
          hintText: '● ● ● ● ● ● ● ●',
          prefixIcon: Icons.lock_reset,
          isPassword: true,
          obscureText: true,
          validator: confirmpasswordvalidator,
        ),
      ],
    );
  }
}
