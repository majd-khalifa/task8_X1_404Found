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

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
    return null;
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return BlocProvider(
      create: (_)=>AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColor.primaryBackground,
        body: BlocConsumer<AuthCubit,AuthState>(
          listener: (context, state) {
            if(state is AuthFailure){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            }else if(state is AuthSuccess){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );

              Navigator.pushReplacementNamed(
                context,
                AppRoute.home,
              );
            }
          },
          builder:(context,state){
            final bool isLoading = state is AuthLoading;
            return Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 300.h,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/poor_thing.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(18.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.primary.withOpacity(0.6),
                                blurRadius: 25,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.movie_filter_sharp,
                            color: Colors.white,
                            size: 30.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// Form
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),

                            Center(
                              child: Text(
                                'Welcome Back',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textPrimary,
                                ),
                              ),
                            ),

                            SizedBox(height: 8.h),

                            Center(
                              child: Text(
                                'Log in to track and rate the latest premieres.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.textSecondary,
                                ),
                              ),
                            ),

                            SizedBox(height: 32.h),

                            Text(
                              'Email Address',
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
                              validator: _validateEmail,
                            ),

                            SizedBox(height: 20.h),

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
                              hintText: 'Enter your password',
                              prefixIcon: Icons.lock_outline,
                              isPassword: true,
                              obscureText: true,
                              validator: _validatePassword,
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: (){},
                                    child: Text('Forgot Password?',style: TextStyle(
                                        fontSize: 16.h,
                                        color: AppColor.primary
                                    ),
                                    )),
                              ],
                            ),

                            SizedBox(height:20.h),

                            PrimaryButton(
                              text: 'Log In',
                              isLoading: isLoading,
                              width: double.infinity,
                              onPressed: isLoading
                                  ? null
                                  : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                                }
                              },
                            ),

                            SizedBox(height: 30.h),

                            Row(
                              children: [
                                Expanded(child: Divider(color: AppColor.border)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Text(
                                    'Or continue with',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColor.textSecondary,
                                    ),
                                  ),
                                ),
                                Expanded(child: Divider(color: AppColor.border)),
                              ],
                            ),

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
                                    icon: Icons.apple,
                                    iconColor: Colors.white,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 34.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    color: AppColor.textSecondary,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(
                                  onTap:(){
                                    Navigator.pushNamed(context, AppRoute.register);
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ]),

                    ),
                  ),
                )   ],
            );
          },
        ),
      ),
    );
  }
}