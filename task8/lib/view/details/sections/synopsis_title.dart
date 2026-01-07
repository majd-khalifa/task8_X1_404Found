// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SynopsisTitle extends StatelessWidget {
  const SynopsisTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Synopsis",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
