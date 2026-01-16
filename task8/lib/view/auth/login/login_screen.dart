import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/helper/snack_bar_helper.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/core/services/services.dart';
import 'package:task8/view/auth/login/sections/go_to_register.dart';
import 'package:task8/view/auth/login/sections/log_in_form_field.dart';
import 'package:task8/view/auth/login/sections/log_in_header.dart';
import 'package:task8/view/auth/login/sections/log_in_with_soctial_media.dart';
import 'package:task8/view/auth/widgets/primary_button.dart';
import '../cubits/auth_cubit.dart';
import '../cubits/auth_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final apiServices = ApiServices();
  final prefsService = SharedPreferencesService();

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
      create: (_) => AuthCubit(prefsService, apiServices),
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              SnackBarHelper.showError(context, state.error);
            } else if (state is AuthSuccess) {
              SnackBarHelper.showSuccess(context, state.message);

              Navigator.pushReplacementNamed(context, AppRoutes.home);
            }
          },
          builder: (context, state) {
            final bool isLoading = state is AuthLoading;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  LogInHeader(),

                  LogInFormField(
                    formKey: _formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    isLoading: isLoading,
                    emailvalidator: _validateEmail,
                    passwordvalidator: _validatePassword,
                  ),
                  const SizedBox(height: 20),

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

                  const SizedBox(height: 30),

                  LogInWithSoctialMedia(),

                  SizedBox(height: 34.h),
                  const GoToRegister(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
