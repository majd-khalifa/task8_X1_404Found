// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/view/details/widgets/cast_item.dart';

/// 🎭 Cast
class CastListWidget extends StatelessWidget {
  final List<String> castImages;
  final List<String> castNames;

  const CastListWidget({
    super.key,
    required this.castImages,
    required this.castNames,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: castNames.length,
            itemBuilder: (context, index) {
              return CastItem(img: castImages[index], name: castNames[index]);
            },
          ),
        ),
      ],
    );
  }
}
