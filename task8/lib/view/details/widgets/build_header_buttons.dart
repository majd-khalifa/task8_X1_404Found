import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/view/details/widgets/circle_button.dart';

class BuildHeaderButtons extends StatelessWidget {
  const BuildHeaderButtons({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.home);
            },
          ),
          Row(
            children: [
              CircleButton(icon: Icons.share),
              const SizedBox(width: 12),
              CircleButton(icon: Icons.favorite_border),
            ],
          ),
        ],
      ),
    );
  }
}
