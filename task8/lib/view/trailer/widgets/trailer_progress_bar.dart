import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:task8/core/constants/app_color.dart';

class TrailerProgressBar extends StatelessWidget {
  final VideoPlayerController? controller;
  final bool initialized;

  const TrailerProgressBar({
    super.key,
    required this.controller,
    required this.initialized,
  });

  @override
  Widget build(BuildContext context) {
    if (!initialized || controller == null) {
      return const SizedBox(height: 12);
    }

    final pos = controller!.value.position;
    final dur = controller!.value.duration;

    final progress = dur.inMilliseconds == 0
        ? 0.0
        : pos.inMilliseconds / dur.inMilliseconds;

    return LinearProgressIndicator(
      value: progress,
      color: AppColors.primary,
      backgroundColor: Colors.white24,
    );
  }
}
