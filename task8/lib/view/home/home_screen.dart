import 'package:flutter/material.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/widgets/bottom_nav.dart';

import 'home_header.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundDark,
      bottomNavigationBar: BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [HomeHeader(), HomeBody()]),
        ),
      ),
    );
  }
}
