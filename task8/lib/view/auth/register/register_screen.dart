import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/helper/snack_bar_helper.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/core/services/services.dart';
import 'package:task8/view/auth/cubits/auth_cubit.dart';
import 'package:task8/view/auth/cubits/auth_state.dart';
import 'package:task8/view/auth/register/sections/form_field_section.dart';
import 'package:task8/view/auth/register/sections/go_to_log_in_section.dart';
import 'package:task8/view/auth/register/sections/other_sign_up_ways_section.dart';
import 'package:task8/view/auth/register/sections/sign_up_header.dart';
import 'package:task8/view/auth/widgets/primary_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final prefsService = SharedPreferencesService();
  final apiServices = ApiServices();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your name';
    if (value.length < 2) return 'Name must be at least 2 characters';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != passwordController.text) return 'Passwords do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(prefsService, apiServices),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            SnackBarHelper.showError(context, state.error);
          } else if (state is AuthSuccess) {
            SnackBarHelper.showSuccess(context, state.message);
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        },
        builder: (context, state) {
          final bool isLoading = state is AuthLoading;

          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColors.gradient1, AppColors.gradient2],
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignUpHeader(),
                      SizedBox(height: 32.h),

                      FormFieldSection(
                        nameController: nameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        namevalidator: _validateName,
                        emailvalidator: _validateEmail,
                        passwordvalidator: _validatePassword,
                        confirmpasswordvalidator: _validateConfirmPassword,
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
                                    password: passwordController.text.trim(),
                                    passwordConfirmation:
                                        confirmPasswordController.text.trim(),
                                  );
                                }
                              },
                      ),

                      SizedBox(height: 32.h),
                      const OtherSignUpWaysSection(),
                      SizedBox(height: 32.h),
                      const GoToLogInSection(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
