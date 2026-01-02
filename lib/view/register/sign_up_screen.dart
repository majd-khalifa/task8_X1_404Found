import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/color/app_color.dart';
import '../../core/constants/routes/app_route.dart';
import '../../cubits/auth_cubit.dart';
import '../../cubits/auth_state.dart';
import '../../widgets/custom_text_feild.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/social_button.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                  ),
                );

                Navigator.pushReplacementNamed(
                  context,
                  AppRoute.login,
                );
              }
            },
            builder: (context, state) {
              final bool isLoading = state is AuthLoading;

              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [AppColor.gradient1,AppColor.gradient2]),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 20.h,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Icon
                        Center(
                          child: Container(
                            width: 100.w,
                            height: 100.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primary.withOpacity(0.5)),
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  AppColor.primary.withOpacity(.1),
                                  AppColor.primary.withOpacity(.1),




                                ],

                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.movie_filter_sharp,
                                color: AppColor.primary,
                                size: 40.w,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24.h),

                        Center(
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: AppColor.textPrimary,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(height: 12.h),

                        Center(
                          child: Text(
                            'Start tracking your watchlist and\n reviewing movies today.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.textSecondary,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),

                        SizedBox(height: 32.h),
                        Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        CustomTextField(
                          controller: nameController,
                          hintText: 'Your full name',
                          prefixIcon: Icons.person_outline,
                          validator: _validateName,
                        ),

                        SizedBox(height: 16.h),
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'name@example.com',
                          prefixIcon: Icons.email_rounded,
                          keyboardType: TextInputType.emailAddress,
                          validator: _validateEmail,
                        ),

                        SizedBox(height: 16.h),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h),

                        CustomTextField(
                          controller: passwordController,
                          hintText: '⬤ ⬤ ⬤ ⬤ ⬤ ⬤ ⬤ ⬤',
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          obscureText: true,
                          validator: _validatePassword,
                        ),

                        SizedBox(height: 16.h),
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h),

                        CustomTextField(
                          controller: confirmPasswordController,
                          hintText: '⬤ ⬤ ⬤ ⬤ ⬤ ⬤ ⬤ ⬤ ',
                          prefixIcon: Icons.lock_reset,
                          isPassword: true,
                          obscureText: true,
                          validator: _validateConfirmPassword,
                        ),

                        SizedBox(height: 32.h),

                        PrimaryButton(
                          text: 'Register',
                          isLoading: isLoading,
                          width: double.infinity,
                          onPressed: isLoading
                              ? null
                              : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().register(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password:
                                passwordController.text.trim(),
                              );
                            }
                          },
                        ),

                        SizedBox(height: 32.h),

                        Row(
                          children: [
                            Expanded(child: Divider(color: AppColor.border)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(
                                  color: AppColor.textSecondary,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: AppColor.border)),
                          ],
                        ),

                        SizedBox(height: 24.h),

                        Row(
                          children: [
                            Expanded(
                              child: SocialButton(
                                icon: Icons.g_mobiledata_rounded,
                                text: 'Google',
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: SocialButton(
                                icon: Icons.apple,
                                text: 'Apple',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 32.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: AppColor.textSecondary,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoute.login,
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
