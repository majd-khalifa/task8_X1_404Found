// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';
import 'package:task8/models/movie_model.dart';
import 'package:task8/view/details/widgets/build_action_buttons.dart';
import 'package:task8/view/details/widgets/build_header_buttons.dart';
import 'package:task8/view/details/widgets/build_movie_info.dart';
import 'package:task8/view/details/widgets/build_poster.dart';

class DetailsHeader extends StatelessWidget {
  final Movie movie;
  const DetailsHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 1.sw,
        height: 0.64.sh,
        child: Stack(
          children: [buildBackground(), buildGradient(), buildContent(context)],
        ),
      ),
    );
  }

  Widget buildBackground() {
    return Positioned.fill(
      child: Image.network(
        movie.posterUrl,
        fit: BoxFit.cover,
        color: Colors.black.withOpacity(0.65),
        colorBlendMode: BlendMode.darken,
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress == null
            ? child
            : const Center(child: CircularProgressIndicator()),
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.error, color: Colors.white54, size: 60),
      ),
    );
  }

  Widget buildGradient() {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.5, 1.0],
            colors: [
              AppColors.backgroundGradientTop,
              AppColors.backgroundGradientMiddle,
              AppColors.backgroundGradientBottom,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          BuildHeaderButtons(context: context),
          BuildPoster(movie: movie),
          const SizedBox(height: 16),
          Text(movie.title, style: AppTextStyles.textStyle30),
          const SizedBox(height: 8),
          Text("Sci-Fi • Adventure • Drama", style: AppTextStyles.textStyle14),
          const SizedBox(height: 16),
          BuildMovieInfo(movie: movie),
          const SizedBox(height: 16),
          BuildActionButtons(movie: movie, context: context),
        ],
      ),
    );
  }
}
