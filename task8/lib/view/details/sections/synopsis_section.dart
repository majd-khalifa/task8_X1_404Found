// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/view/details/sections/rating_card.dart';
import 'package:task8/view/details/sections/synopsis_text.dart';
import 'package:task8/view/details/sections/synopsis_title.dart';

class RatingAndSynopsisSection extends StatelessWidget {
  const RatingAndSynopsisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ⭐ Rating Card
          RatingCard(),


          SynopsisTitle(),
          SizedBox(height: 8.h),

          SynopsisText(),
        ],
      ),
    );
  }
}
