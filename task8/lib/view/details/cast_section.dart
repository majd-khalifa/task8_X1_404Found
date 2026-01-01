import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_image.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/view/details/widgets/cast_item.dart';
=======
>>>>>>> f868a9ea667c193ac5c8aebda07aa90cee954c45

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
<<<<<<< HEAD
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Cast", style: AppTextStyles.textStyle18),
=======
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Cast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
>>>>>>> f868a9ea667c193ac5c8aebda07aa90cee954c45
        ),

        const SizedBox(height: 12),

        SizedBox(
<<<<<<< HEAD
          height: 110.h,
=======
          height: 110,
>>>>>>> f868a9ea667c193ac5c8aebda07aa90cee954c45
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
<<<<<<< HEAD
              CastItem(img: AppImage.castimage1, name: "Matthew M."),
              CastItem(img: AppImage.castimage2, name: "Anne H."),
              CastItem(img: AppImage.castimage1, name: "Jessica C."),
              CastItem(img: AppImage.castimage2, name: "Mackenzie F."),
=======
              _castItem("assets/images/unnamed (9).png", "Matthew M."),
              _castItem("assets/images/unnamed (10).png", "Anne H."),
              _castItem("assets/images/unnamed (9).png", "Jessica C."),
              _castItem("assets/images/unnamed (10).png", "Mackenzie F."),
>>>>>>> f868a9ea667c193ac5c8aebda07aa90cee954c45
            ],
          ),
        ),
      ],
    );
  }
<<<<<<< HEAD
=======

  Widget _castItem(String img, String name) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(radius: 32, backgroundImage: AssetImage(img)),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
>>>>>>> f868a9ea667c193ac5c8aebda07aa90cee954c45
}
