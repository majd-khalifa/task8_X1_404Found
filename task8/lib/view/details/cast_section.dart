import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_image.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/view/details/widgets/cast_item.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Cast", style: AppTextStyles.textStyle18),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 110.h,



          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              CastItem(img: AppImage.castimage1, name: "Matthew M."),
              CastItem(img: AppImage.castimage2, name: "Anne H."),
              CastItem(img: AppImage.castimage1, name: "Jessica C."),
              CastItem(img: AppImage.castimage2, name: "Mackenzie F."),
            ],
          ),
        ),
      ],
    );
  }
}
