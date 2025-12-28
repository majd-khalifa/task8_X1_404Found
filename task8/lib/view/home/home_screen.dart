import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 200.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16.r),
          ),
          alignment: Alignment.center,
          child: Text("ScreenUtil Test", style: AppTextStyles.textStyle16),
        ),
      ),
    );
  }
}
