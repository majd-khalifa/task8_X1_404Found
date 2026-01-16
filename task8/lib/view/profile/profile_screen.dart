import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/app_image.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/constants/constant.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/core/services/services.dart';
import 'package:task8/widgets/bottom_nav.dart';
import 'package:task8/core/services/api/api_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String email = "";
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = SharedPreferencesService();

    name = await prefs.getStringValue("user_name") ?? "";
    email = await prefs.getStringValue("user_email") ?? "";

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Scaffold(
            backgroundColor: AppColors.backgroundDark,
            bottomNavigationBar: const BottomNav(initialIndex: 3),
            body: SafeArea(
              child: Column(
                children: [
                  40.verticalSpace,
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: const BoxDecoration(
                            color: Color(0xFFBB86FC),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 120.w,
                            height: 120.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              AppImage.majed,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        16.verticalSpace,
                        Text(
                          name,
                          style: AppTextStyles.textStyle24.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          email,
                          style: AppTextStyles.textStyle14.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  50.verticalSpace,
                  _buildMenuItem(
                    icon: Icons.bookmark_outline,
                    title: 'My Watchlist',
                    onTap: () => print('Watchlist Clicked'),
                  ),
                  _buildMenuItem(
                    icon: Icons.rate_review_outlined,
                    title: 'My Reviews',
                    onTap: () => print('Reviews Clicked'),
                  ),
                  _buildMenuItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () => print('Settings Clicked'),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 20.h,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB56D76),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: () async {
                          final token = await SharedPreferencesService()
                              .getStringValue(ConstantData.usertokenKey);
                          try {
                            await ApiServices().postData(
                              url: ApiLink.logout,
                              token: token,
                            );
                          } catch (e) {
                            debugPrint("Logout API failed: $e");
                          }
                          await SharedPreferencesService().removeAllData();

                          ApiServices.currentUser = null;
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.login,
                          );
                        },
                        child: Text(
                          "Logout",
                          style: AppTextStyles.textStyle18.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.cardDark,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: const Color(0xFFBB86FC), size: 24.sp),
            ),
            16.horizontalSpace,
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white10, width: 1.0.h),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.textStyle18.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.sp,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
