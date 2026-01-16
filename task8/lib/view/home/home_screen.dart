import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/widgets/bottom_nav.dart';
import 'package:task8/view/home/cubit/home_cubit.dart';

import 'home_header.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadMovies(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        bottomNavigationBar: const BottomNav(initialIndex: 0),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                HomeHeader(),
                HomeBody(), // UI فقط – اللوجيك كله داخل Cubit
              ],
            ),
          ),
        ),
      ),
    );
  }
}
