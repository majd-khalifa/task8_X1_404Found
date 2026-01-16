// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/constant.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/core/services/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final prefs = SharedPreferencesService();
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    // قراءة التوكن والإيميل من SharedPreferences
    ConstantData.usertoken =
        await prefs.getStringValue(ConstantData.usertokenKey) ?? "";

    ConstantData.useremail =
        await prefs.getStringValue(ConstantData.useremailKey) ?? "";

    // طباعة القيم الحقيقية
    print("SPLASH TOKEN: ${ConstantData.usertoken}");
    print("SPLASH EMAIL: ${ConstantData.useremail}");

    if (!mounted) return;

    // التحقق الصحيح
    if (ConstantData.usertoken.isEmpty || ConstantData.useremail.isEmpty) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          /// الخلفية
          Positioned.fill(child: Container(color: AppColors.backgroundDark)),

          /// المحتوى الأساسي
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// أيقونة الفيلم داخل مربع
                Container(
                  width: 112.w,
                  height: 112.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Icon(
                          Icons.movie_filter,
                          size: 72.sp,
                          color: AppColors.primary,
                        ),
                      ),
                      Positioned(
                        top: -12,
                        right: -12,
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(.4),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.grade,
                            size: 22.sp,
                            color: AppColors.backgroundDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                /// عنوان التطبيق
                Text(
                  "MovieReview",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textStyle36.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),

                SizedBox(height: 8.h),

                /// الشعار النصي
                Text(
                  "SHARE YOUR PERSPECTIVE",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textStyle12.copyWith(
                    color: AppColors.textMuted,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          /// الفوتر
          Positioned(
            bottom: 48.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Powered by Mohamad Al-Zoubi | Flutter Beg V.9",
                  style: AppTextStyles.textStyle10.copyWith(
                    color: AppColors.textMuted,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: 120.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
