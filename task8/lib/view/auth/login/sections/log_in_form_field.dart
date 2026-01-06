import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';

import 'package:task8/core/constants/text_style.dart';

import 'package:task8/view/auth/widgets/custom_text_feild.dart';

class LogInFormField extends StatelessWidget {
  const LogInFormField({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.emailvalidator,
    required this.passwordvalidator,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final String? Function(String?)? emailvalidator;
  final String? Function(String?)? passwordvalidator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),

              /// Email Label
              Text(
                'Email Address',
                style: AppTextStyles.textStyle16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6.h),

              /// Email Field
              CustomTextField(
                controller: emailController,
                hintText: 'name@example.com',
                prefixIcon: Icons.email_rounded,
                validator: emailvalidator,
              ),

              const SizedBox(height: 20),

              Text(
                'Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(height: 20.h),

              /// Password Label
              Text(
                'Password',
                style: AppTextStyles.textStyle16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6.h),

              /// Password Field
              CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                prefixIcon: Icons.lock,
                isPassword: true,
                obscureText: true,
                validator: passwordvalidator,
              ),

              const SizedBox(height: 2),

              SizedBox(height: 2.h),

              /// Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.textStyle16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
